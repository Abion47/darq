import 'prepend.dart';

extension SubsetsExtension<T> on Iterable<T> {
  /// Returns an iterable of iterables which represents the power set of this
  /// iterable.
  Iterable<Iterable<T>> subsets() {
    return _subsetRecursive(this);
  }

  Iterable<Iterable<T>> _subsetRecursive(Iterable<T> input) sync* {
    var index = 0;

    for (var o in input) {
      yield [o];
      yield* _subsetRecursive(input.skip(index)).map((l) => l.prepend(o));
      index++;
    }
  }
}
