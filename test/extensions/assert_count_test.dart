import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('count', () {
    test('Assert passes', () {
      final list = [0, 1, 2, 3, 4, 5];
      list.assertCount(6);
    });

    test('Assert fails', () {
      final list = [0, 1, 2, 3, 4, 5];
      final task = () => list.assertCount(0);
      expect(task, throwsA(isA<AssertionError>()));
    });
  });
}
