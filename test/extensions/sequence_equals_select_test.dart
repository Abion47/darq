import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('sequenceEquals', () {
    test('Sequences match with outer selector', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.sequenceEqualsSelect<String, String>(
        ['A', 'B', 'C', 'D', 'E'],
        innerSelector: (s) => s.toLowerCase(),
        outerSelector: (s) => s,
      );
      expect(result, isTrue);
    });

    test('Sequences match with inner selector', () {
      final list = ['a', 'b', 'c'];
      final result = list.sequenceEqualsSelect<int, int>(
        [97, 98, 99],
        innerSelector: (i) => i,
        outerSelector: (s) => s.codeUnitAt(0),
      );
      expect(result, isTrue);
    });
  });
}
