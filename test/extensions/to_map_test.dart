import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('toMap', () {
    test('int list to map', () {
      final input = [1, 2, 3, 4, 5];
      final result = input.toMap((x) => MapEntry(x, x.toString()));
      expect(result, equals({1: '1', 2: '2', 3: '3', 4: '4', 5: '5'}));
    });

    test('int list to unmodifiable map', () {
      final input = [1, 2, 3, 4, 5];
      final result =
          input.toMap((x) => MapEntry(x, x.toString()), modifiable: false);
      expect(result, equals({1: '1', 2: '2', 3: '3', 4: '4', 5: '5'}));
      final task = () => result[6] = '6';
      expect(task, throwsA(isA<UnsupportedError>()));
    });
  });
}
