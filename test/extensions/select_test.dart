import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('select', () {
    test('Basic mapping', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.select((c, i) => c.codeUnits[0]);
      expect(result, orderedEquals(<int>[97, 98, 99, 100, 101]));
    });

    test('Mapping using index', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.select((c, i) => '${i}_${c.codeUnits[0]}');
      expect(result,
          orderedEquals(<String>['0_97', '1_98', '2_99', '3_100', '4_101']));
    });
  });
}
