import 'equality_comparer.dart';
import 'grouping.dart';
import '../extensions/non_null.dart';

abstract class ILookup<TKey, TValue> {
  int get count;

  bool containsKey(TKey key);

  Iterable<TValue> operator [](TKey key);
}

/// This is a utility class used by grouping `Iterable` methods and isn't
/// intended to be instantiated directly.
class Lookup<TKey, TValue> extends Iterable<Grouping<TKey, TValue>>
    implements ILookup<TKey, TValue> {
  late EqualityComparer<TKey> comparer;
  late List<Grouping<TKey, TValue>?> groupings;
  late int _count;

  Grouping<TKey, TValue>? lastGrouping;

  Lookup._internal(EqualityComparer<TKey>? comparer) {
    this.comparer = comparer ?? EqualityComparer.forType<TKey>();
    groupings = List<Grouping<TKey, TValue>?>.filled(7, null);
    _count = 0;
  }

  static Lookup<TKey, TValue> create<TSource, TKey, TValue>(
    Iterable<TSource> source,
    TKey Function(TSource) keySelector,
    TValue Function(TSource) valueSelector,
    EqualityComparer<TKey> comparer,
  ) {
    final lookup = Lookup<TKey, TValue>._internal(comparer);
    for (final item in source) {
      lookup.getGrouping(keySelector(item), true)?.add(valueSelector(item));
    }
    return lookup;
  }

  static Lookup<TKey, TValue> createFromMap<TKey, TValue>(
    Map<TKey, TValue> map,
    EqualityComparer<TKey> comparer,
  ) {
    return Lookup.create<MapEntry<TKey, TValue>, TKey, TValue>(
      map.entries,
      (entry) => entry.key,
      (entry) => entry.value,
      comparer,
    );
  }

  static Lookup<TKey, TValue> createForJoin<TKey, TValue>(
    Iterable<TValue> source,
    TKey Function(TValue) keySelector,
    EqualityComparer<TKey> comparer,
  ) {
    final lookup = Lookup<TKey, TValue>._internal(comparer);
    for (final item in source) {
      final key = keySelector(item);
      if (key != null) {
        lookup.getGrouping(key, true)?.add(item);
      }
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
    getGrouping(key, true)?.add(value);
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
        g = g!.next;
        yield g!;
      } while (g != lastGrouping);
    }
  }

  int _internalGetHash(TKey value) {
    return (value == null) ? 0 : comparer.hash(value);
  }

  Iterable<TResult> applyResultSelector<TResult>(
      TResult Function(TKey key, Iterable<TValue> group) resultSelector) sync* {
    var g = lastGrouping;
    if (g != null) {
      do {
        g = g!.next;
        if (g!.count != g.elements.length) g.elements.length = g.count;
        yield resultSelector(g.key, g.elements);
      } while (g != lastGrouping);
    }
  }

  Grouping<TKey, TValue>? getGrouping(TKey key, bool shouldCreate) {
    var hash = _internalGetHash(key);
    for (var g = groupings[hash % groupings.length];
        g != null;
        g = g.hashNext) {
      if (g.hashCode == hash && comparer.compare(g.key, key)) return g;
    }

    if (shouldCreate) {
      if (_count == groupings.length) resizeBuffer();
      final index = hash % groupings.length;
      final g = Grouping<TKey, TValue>([], key, hash);
      g.key = key;
      g.hash = hash;
      g.elements = [];
      g.hashNext = groupings[index];
      groupings[index] = g;
      if (lastGrouping == null) {
        g.next = g;
      } else {
        g.next = lastGrouping?.next;
        lastGrouping?.next = g;
      }
      lastGrouping = g;
      _count++;
      return g;
    }

    return null;
  }

  void resizeBuffer() {
    var newSize = count * 2 + 1;
    if (newSize < count) throw Exception('Integer overflow');

    final newGroupings = List<Grouping<TKey, TValue>?>.filled(newSize, null);
    var g = lastGrouping;
    do {
      g = g?.next;
      if (g == null) {
        throw StateError('There shouldn\'t be a null group in groupings');
      }
      final index = g.hashCode % newSize;
      g.hashNext = newGroupings[index];
      newGroupings[index] = g;
    } while (g != lastGrouping);

    groupings = newGroupings.nonNull().toList();
  }
}
