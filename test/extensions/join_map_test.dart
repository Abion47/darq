import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('joinMap', () {
    test('Join on map keys', () {
      final a = {'1': 1, '2': 2, '3': 3, '4': 4};
      final b = {'1': 1.0, '2': 2.0, '3': 3.0, '5': 5.0};

      final output = a.entries.joinMap<MapEntry<String, num>, String, String>(
        b.entries,
        (x, y) => '${x.value}_${y.value}',
        outerKeySelector: (x) => x.key,
        innerKeySelector: (y) => y.key,
      );
      expect(output, orderedEquals(<String>['1_1.0', '2_2.0', '3_3.0']));
    });
  });
}
