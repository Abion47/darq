import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('average', () {
    test('on ints', () {
      final list = [1, 3, 5, 7, 9];
      final result = list.average();
      expect(result, equals(5.0));

      final list2 = [1, 2, 3, 4];
      final result2int = list2.average<int>();
      expect(result2int, equals(2));
      final result2double = list2.average<double>();
      expect(result2double, equals(2.5));
    });

    test('on doubles', () {
      final list = [1.0, 3.0, 5.0, 7.0, 9.0];
      final result = list.average();
      expect(result, equals(5.0));

      final list2 = [1.0, 2.0, 3.0, 4.0];
      final result2int = list2.average<int>();
      expect(result2int, equals(2));
      final result2double = list2.average<double>();
      expect(result2double, equals(2.5));
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

    test('Error: empty iterable', () {
      final list = <int>[];
      void task() => list.average();
      expect(task, throwsA(isA<StateError>()));
    });

    test('Error: on non-numeric without selector', () {
      final list = ['a', 'ab', 'abc'];
      void task() => list.average();
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
