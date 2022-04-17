import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('assertAny', () {
    test('on bool: one true', () {
      final list = [false, false, true];
      list.assertAny((b) => b);
    });

    test('on bool: all false', () {
      final list = [false, false, false];
      void task() => list.assertAny((b) => b);
      expect(task, throwsA(isA<AssertionError>()));
    });

    test('on ints: one even', () {
      final list = [1, 3, 4];
      list.assertAny((x) => x.isEven);
    });

    test('on ints: all odd', () {
      final list = [1, 3, 5];
      void task() => list.assertAny((x) => x.isEven);
      expect(task, throwsA(isA<AssertionError>()));
    });
  });
}
