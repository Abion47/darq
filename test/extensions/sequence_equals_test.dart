import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('sequenceEquals', () {
    test('Sequences match', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final output = list.sequenceEquals(['a', 'b', 'c', 'd', 'e']);
      expect(output, isTrue);
    });

    test('Sequences don\'t match content', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.sequenceEquals(['b', 'c', 'd', 'e', 'a']);
      expect(result, isFalse);
    });

    test('Sequences don\'t match length (short)', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.sequenceEquals(['a', 'b', 'c', 'd']);
      expect(result, isFalse);
    });

    test('Sequences don\'t match length (long)', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.sequenceEquals(['a', 'b', 'c', 'd', 'e', 'f']);
      expect(result, isFalse);
    });

    test('Sequences match with outer selector', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.sequenceEquals<String, String>(
        ['A', 'B', 'C', 'D', 'E'],
        innerSelector: (s) => s.toLowerCase(),
      );
      expect(result, isTrue);
    });

    test('Sequences match with inner selector', () {
      final list = ['a', 'b', 'c'];
      final result = list.sequenceEquals(
        [97, 98, 99],
        outerSelector: (s) => s.codeUnitAt(0),
      );
      expect(result, isTrue);
    });
  });
}
