import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('startsWith', () {
    test('success', () {
      final list = [0, 1, 2, 3, 4, 5];
      final result = list.startsWith([0, 1, 2]);
      expect(result, isTrue);
    });

    test('fail', () {
      final list = [0, 1, 2, 3, 4, 5];
      final result = list.startsWith([1, 2, 3]);
      expect(result, isFalse);
    });

    test('Error: null other', () {
      final list = [0, 1, 2, 3, 4, 5];
      final result = () => list.startsWith(null);
      expect(result, throwsA(isA<ArgumentError>()));
    });
  });
}
