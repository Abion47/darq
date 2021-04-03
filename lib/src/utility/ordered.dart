import 'equality_comparer.dart';

abstract class OrderedIterable<T> extends Iterable<T> {
  Iterable<T> source;

  OrderedIterable(this.source);
  IterableSorter<T> getIterableSorter(IterableSorter<T> next);

  OrderedIterable<T> createOrderedIterable<TNewKey>(
      TNewKey Function(T) keySelector,
      EqualityComparer<TNewKey> keyComparer,
      bool descending) {
    final result = InternalOrderedIterable<T, TNewKey>(
        source, keySelector, keyComparer, descending);
    result.parent = this;
    return result;
  }
}

/// This class is created by calls to `Iterable.orderBy` (and related) and isn't
/// intended to be instantiated directly.
class InternalOrderedIterable<TValue, TKey> extends OrderedIterable<TValue> {
  TKey Function(TValue) keySelector;
  EqualityComparer<TKey> keyComparer;
  bool descending;

  OrderedIterable<TValue>? parent;

  InternalOrderedIterable(Iterable<TValue> source, this.keySelector,
      this.keyComparer, this.descending)
      : super(source) {
    this.source = source;
  }

  @override
  Iterator<TValue> get iterator => iterate().iterator;
  Iterable<TValue> iterate() sync* {
    final buffer = source.toList();
    if (buffer.isNotEmpty) {
      final sorter = getIterableSorter(null);
      final map = sorter.sort(buffer, buffer.length);
      yield* OrderedBuffer(buffer, map);
    }
  }

  @override
  IterableSorter<TValue> getIterableSorter(IterableSorter<TValue>? next) {
    IterableSorter<TValue> sorter = InternalIterableSorter<TValue, TKey>(
        keySelector, keyComparer, descending, next);
    if (parent != null) sorter = parent!.getIterableSorter(sorter);
    return sorter;
  }
}

abstract class IterableSorter<T> {
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
      var i = left;
      var j = right;
      final x = map[i + ((j - i) >> 1)];
      do {
        while (i < map.length && compareKeys(x, map[i]) > 0) {
          i++;
        }
        while (j >= 0 && compareKeys(x, map[j]) < 0) {
          j--;
        }
        if (i > j) break;
        if (i < j) {
          final temp = map[i];
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

/// This class is created by calls to `Iterable.orderBy` (and related) and isn't
/// intended to be instantiated directly.
class InternalIterableSorter<TValue, TKey> extends IterableSorter<TValue> {
  TKey Function(TValue) keySelector;
  bool descending;

  late EqualityComparer<TKey> comparer;

  List<TKey>? keys;
  IterableSorter<TValue>? next;

  InternalIterableSorter(
    this.keySelector,
    EqualityComparer<TKey>? comparer,
    this.descending,
    this.next,
  ) {
    this.comparer = comparer ?? EqualityComparer.forType<TKey>();
  }

  @override
  void computeKeys(List<TValue> elements, int count) {
    keys = <TKey>[];
    for (var i = 0; i < count; i++) {
      keys?.add(keySelector(elements[i]));
    }
    if (next != null) next!.computeKeys(elements, count);
  }

  @override
  int compareKeys(int index1, int index2) {
    if (keys == null) {
      throw StateError('Cannot sort keys when the keys list is null');
    }
    final c = comparer.sort(keys![index1], keys![index2]);
    if (c == 0) {
      if (next == null) return index1 - index2;
      return next!.compareKeys(index1, index2);
    }
    return descending ? -c : c;
  }
}

/// This class is created by calls to `Iterable.orderBy` (and related) and isn't
/// intended to be instantiated directly.
class OrderedBuffer<T> extends Iterable<T> {
  List<T> data;
  List<int> orderedMap;

  OrderedBuffer(this.data, this.orderedMap);

  @override
  Iterator<T> get iterator => iterate().iterator;
  Iterable<T> iterate() sync* {
    for (var index in orderedMap) {
      yield data[index];
    }
  }
}
