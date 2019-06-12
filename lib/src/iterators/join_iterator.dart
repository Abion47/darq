import '../lookup.dart';
import '../grouping.dart';
import '../enumerable_iterator.dart';
import '../enumerables/join_enumerable.dart';

class JoinIterator<TFirst, TSecond, TKey, TResult>
    extends EnumerableIterator<TFirst, TResult> {
  JoinIterator(JoinEnumerable<TFirst, TSecond, TKey, TResult> enumerable)
      : super.of(enumerable);

  Lookup<TKey, TSecond> _lookup;
  TFirst _outerValue;
  Iterator<TSecond> _groupIterator;

  @override
  bool moveNext() {
    final castEnum =
        enumerable as JoinEnumerable<TFirst, TSecond, TKey, TResult>;

    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _lookup = Lookup.createForJoin(
          castEnum.second, castEnum.innerKeySelector, castEnum.keyComparer);
    }

    if (_groupIterator != null) {
      if (_groupIterator.moveNext()) {
        current = castEnum.selector(_outerValue, _groupIterator.current);
        return true;
      } else {
        _groupIterator = null;
      }
    }

    TKey outerKey;
    Grouping<TKey, TSecond> grouping;
    while (sourceIterator.moveNext()) {
      _outerValue = sourceIterator.current;
      outerKey = castEnum.outerKeySelector(sourceIterator.current);
      grouping = _lookup.getGrouping(outerKey, false);
      if (grouping != null) {
        _groupIterator = grouping.iterator;
        if (_groupIterator.moveNext()) {
          current = castEnum.selector(_outerValue, _groupIterator.current);
          return true;
        } else {
          _groupIterator = null;
        }
      }
    }

    sourceIterator = null;
    _groupIterator = null;
    _lookup = null;
    current = null;
    return false;
  }
}
