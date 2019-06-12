import 'equality_comparer.dart';
import 'typedefs.dart';
import 'enumerable.dart';

abstract class OrderedEnumerable<T> extends Enumerable<T> {
  Enumerable<T> source;

  OrderedEnumerable(this.source);
  EnumerableSorter<T> getEnumerableSorter(EnumerableSorter<T> next);

  OrderedEnumerable<T> createOrderedEnumerable<TKey>(
      Selector<T, TKey> keySelector,
      EqualityComparer<TKey> keyComparer,
      bool descending) {
    final result = InternalOrderedEnumerable<T, TKey>(
        source, keySelector, keyComparer, descending);
    result.parent = this;
    return result;
  }
}

class InternalOrderedEnumerable<TValue, TKey>
    extends OrderedEnumerable<TValue> {
  OrderedEnumerable<TValue> parent;
  Selector<TValue, TKey> keySelector;
  EqualityComparer<TKey> keyComparer;
  bool descending;

  InternalOrderedEnumerable(Enumerable<TValue> source, this.keySelector,
      this.keyComparer, this.descending)
      : super(source) {
    this.source = source;
  }

  @override
  Iterator<TValue> get iterator => iterate().iterator;
  Iterable<TValue> iterate() sync* {
    final buffer = source.ToList();
    if (buffer.length > 0) {
      final sorter = getEnumerableSorter(null);
      final map = sorter.sort(buffer, buffer.length);
      yield* OrderedBuffer(buffer, map);
    }
  }

  EnumerableSorter<TValue> getEnumerableSorter(EnumerableSorter<TValue> next) {
    EnumerableSorter<TValue> sorter = InternalEnumerableSorter<TValue, TKey>(
        keySelector, keyComparer, descending, next);
    if (parent != null) sorter = parent.getEnumerableSorter(sorter);
    return sorter;
  }
}

abstract class EnumerableSorter<T> {
  void computeKeys(List<T> elements, int count);
  int compareKeys(int idx1, int idx2);

  List<int> sort(List<T> elements, int count) {
    computeKeys(elements, count);
    final map = List<int>.generate(count, (i) => i, growable: false);
    quickSort(map, 0, count - 1);
    return map;
  }

  void quickSort(List<int> map, int left, int right) {
    do {
      int i = left;
      int j = right;
      int x = map[i + ((j - i) >> 1)];
      do {
        while (i < map.length && compareKeys(x, map[i]) > 0) i++;
        while (j >= 0 && compareKeys(x, map[j]) < 0) j--;
        if (i > j) break;
        if (i < j) {
          int temp = map[i];
          map[i] = map[j];
          map[j] = temp;
        }
        i++;
        j--;
      } while (i <= j);
      if (j - left <= right - i) {
        if (left < j) quickSort(map, left, j);
        left = i;
      } else {
        if (i < right) quickSort(map, i, right);
        right = j;
      }
    } while (left < right);
  }
}

class InternalEnumerableSorter<TValue, TKey> extends EnumerableSorter<TValue> {
  Selector<TValue, TKey> keySelector;
  EqualityComparer<TKey> comparer;
  bool descending;
  EnumerableSorter<TValue> next;
  List<TKey> keys;

  InternalEnumerableSorter(
      this.keySelector, this.comparer, this.descending, this.next) {
    this.keySelector = keySelector;
    this.comparer = comparer ?? EqualityComparer.forType<TKey>();
    this.descending = descending;
    this.next = next;
  }

  @override
  void computeKeys(List<TValue> elements, int count) {
    keys = List<TKey>(count);
    for (int i = 0; i < count; i++) keys[i] = keySelector(elements[i]);
    if (next != null) next.computeKeys(elements, count);
  }

  @override
  int compareKeys(int index1, int index2) {
    int c = comparer.sort(keys[index1], keys[index2]);
    if (c == 0) {
      if (next == null) return index1 - index2;
      return next.compareKeys(index1, index2);
    }
    return descending ? -c : c;
  }
}

class OrderedBuffer<T> extends Iterable<T> {
  List<T> data;
  List<int> orderedMap;

  OrderedBuffer(this.data, this.orderedMap);

  @override
  Iterator<T> get iterator => iterate().iterator;
  Iterable<T> iterate() sync* {
    for (var index in orderedMap) yield data[index];
  }
}
