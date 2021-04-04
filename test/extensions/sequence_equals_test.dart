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
  });
}
