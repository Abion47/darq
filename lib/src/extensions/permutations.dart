import 'prepend.dart';
import 'exclude_at.dart';

extension PermutationsExtension<T> on Iterable<T> {
  /// Returns an iterable that consists of iterables, where each iterable is
  /// a collection of all the permutations of the elements in this iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3];
  ///       final result = list.permutations();
  ///
  ///       // Result: [
  ///       //   [ 1, 2, 3],
  ///       //   [ 1, 3, 2],
  ///       //   [ 2, 1, 3],
  ///       //   [ 2, 3, 1],
  ///       //   [ 3, 1, 2],
  ///       //   [ 3, 2, 1],
  ///       // ]
  ///     }
  Iterable<Iterable<T>> permutations() {
    return _permutationsRecursive(this);
  }

  Iterable<Iterable<T>> _permutationsRecursive(Iterable<T> input) sync* {
    var index = 0;
    for (var o in input) {
      yield* _permutationsRecursive(input.excludeAt(index))
          .map((i) => i.prepend(o));
      index++;
    }
    // if (input.length <= 1) {
    //   yield input;
    //   return;
    // }

    // if (input.length == 2) {
    //   yield [input[0], input[1]];
    //   yield [input[1], input[0]];
    //   return;
    // }

    // for (var i = 0; i < input.length; i++) {
    //   final element = input[i];
    //   yield* _permutationsRecursive([
    //     ...input.sublist(0, i),
    //     ...input.sublist(i + 1, input.length),
    //   ]).map((l) => l.prepend(element));
    // }
  }
}
