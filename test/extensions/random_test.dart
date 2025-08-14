import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('random', () {
    test('on ints', () {
      final list = [1, 2, 3];
      final result = list.random();

      expect(list.contains(result), isTrue);
    });

    test('on empty list', () {
      final list = [];
      task() => list.random();
      expect(task, throwsA(isA<StateError>()));
    });
  });
}
