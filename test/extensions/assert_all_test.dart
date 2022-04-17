import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('assertAll', () {
    test('on bool: all true', () {
      final list = [true, true, true, true];
      list.assertAll((b) => b);
    });

    test('on bool: one false', () {
      final list = [true, true, true, false];
      void task() => list.assertAll((b) => b);
      expect(task, throwsA(isA<AssertionError>()));
    });

    test('on ints: all even', () {
      final list = [2, 4, 6, 8];
      list.assertAll((x) => x.isEven);
    });

    test('on ints: one odd', () {
      final list = [2, 4, 6, 7];
      void task() => list.assertAll((x) => x.isEven);
      expect(task, throwsA(isA<AssertionError>()));
    });
  });
}
