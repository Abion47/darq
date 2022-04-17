import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('average', () {
    test('on ints', () {
      final list = [1, 3, 5, 7, 9];
      final result = list.average();
      expect(result, equals(5.0));
    });

    test('on doubles', () {
      final list = [1.0, 2.0];
      final result = list.average();
      expect(result, equals(1.5));
    });

    test('on nums', () {
      final list = [1.0, 2, 3.0];
      final result = list.average();
      expect(result, equals(2.0));
    });

    test('on strings', () {
      final list = ['a', 'ab', 'abc'];
      final result = list.average<int>((s) => s.length);
      expect(result, equals(2.0));
    });

    test('Error: on non-numeric without selector', () {
      final list = ['a', 'ab', 'abc'];
      void task() => list.average();
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
