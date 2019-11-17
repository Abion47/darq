import 'equality_comparer.dart';
import 'errors.dart';
import 'typedefs.dart';
import 'grouping.dart';

abstract class ILookup<TKey, TValue> {
  int get count;

  bool containsKey(TKey key);

  Iterable<TValue> operator [](TKey key);
}

class Lookup<TKey, TValue> extends Iterable<Grouping<TKey, TValue>>
    implements ILookup<TKey, TValue> {
  EqualityComparer<TKey> comparer;
  List<Grouping<TKey, TValue>> groupings;
  Grouping<TKey, TValue> lastGrouping;
  int _count;

  Lookup._internal(this.comparer) {
    if (comparer == null) comparer = EqualityComparer.forType<TKey>();
    groupings = List<Grouping<TKey, TValue>>(7);
    _count = 0;
  }

  static Lookup<TKey, TValue> create<TSource, TKey, TValue>(
    Iterable<TSource> source,
    Selector<TSource, TKey> keySelector,
    Selector<TSource, TValue> valueSelector,
    EqualityComparer<TKey> comparer,
  ) {
    ArgumentError.checkNotNull(source);
    ArgumentError.checkNotNull(keySelector);
    ArgumentError.checkNotNull(valueSelector);
    final lookup = Lookup<TKey, TValue>._internal(comparer);
    for (final item in source) {
      lookup.getGrouping(keySelector(item), true).add(valueSelector(item));
    }
    return lookup;
  }

  static Lookup<TKey, TValue> createFromMap<TKey, TValue>(
    Map<TKey, TValue> map,
    EqualityComparer<TKey> comparer,
  ) {
    ArgumentError.checkNotNull(map);
    return Lookup.create(
      map.entries,
      (entry) => entry.key,
      (entry) => entry.value,
      comparer,
    );
  }

  static Lookup<TKey, TValue> createForJoin<TKey, TValue>(
    Iterable<TValue> source,
    Selector<TValue, TKey> keySelector,
    EqualityComparer<TKey> comparer,
  ) {
    ArgumentError.checkNotNull(source);
    ArgumentError.checkNotNull(keySelector);
    final lookup = Lookup<TKey, TValue>._internal(comparer);
    for (final item in source) {
      final key = keySelector(item);
      if (key != null) lookup.getGrouping(key, true).add(item);
    }
    return lookup;
  }

  @override
  int get count => _count;

  @override
  Iterable<TValue> operator [](TKey key) {
    final grouping = getGrouping(key, false);
    if (grouping != null) return grouping;
    return Iterable<TValue>.empty();
  }

  operator []=(TKey key, TValue value) {
    getGrouping(key, true).add(value);
  }

  @override
  bool containsKey(TKey key) {
    return getGrouping(key, false) != null;
  }

  @override
  Iterator<Grouping<TKey, TValue>> get iterator => iterate().iterator;
  Iterable<Grouping<TKey, TValue>> iterate() sync* {
    var g = lastGrouping;
    if (g != null) {
      do {
        g = g.next;
        yield g;
      } while (g != lastGrouping);
    }
  }

  int _internalGetHash(TKey value) {
    return (value == null) ? 0 : comparer.hash(value);
  }

  Iterable<TResult> applyResultSelector<TResult>(
      GroupSelector<TKey, Iterable<TValue>, TResult> resultSelector) sync* {
    var g = lastGrouping;
    if (g != null) {
      do {
        g = g.next;
        if (g.count != g.elements.length) g.elements.length = g.count;
        yield resultSelector(g.key, g.elements);
      } while (g != lastGrouping);
    }
  }

  Grouping<TKey, TValue> getGrouping(TKey key, bool shouldCreate) {
    var hash = _internalGetHash(key);
    for (var g = groupings[hash % groupings.length];
        g != null;
        g = g.hashNext) {
      if (g.hashCode == hash && comparer.compare(g.key, key)) return g;
    }

    if (shouldCreate) {
      if (_count == groupings.length) resizeBuffer();
      final index = hash % groupings.length;
      final g = Grouping<TKey, TValue>();
      g.key = key;
      g.hash = hash;
      g.elements = [];
      g.hashNext = groupings[index];
      groupings[index] = g;
      if (lastGrouping == null) {
        g.next = g;
      } else {
        g.next = lastGrouping.next;
        lastGrouping.next = g;
      }
      lastGrouping = g;
      _count++;
      return g;
    }

    return null;
  }

  void resizeBuffer() {
    int newSize = count * 2 + 1;
    if (newSize < count) throw IntegerOverflowError();

    final newGroupings = List<Grouping>(newSize);
    var g = lastGrouping;
    do {
      g = g.next;
      int index = g.hashCode % newSize;
      g.hashNext = newGroupings[index];
      newGroupings[index] = g;
    } while (g != lastGrouping);

    groupings = newGroupings;
  }
}
