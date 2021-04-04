import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('min', () {
    test('on ints', () {
      final list = [0, 1, 2, 3];
      final result = list.min();
      expect(result, 0);
    });

    test('on Strings', () {
      final list = ['0', '1', '2', '3', '10'];
      final result = list.min();
      expect(result, '0');
    });

    test('on Strings with comparer', () {
      final list = ['0', '1', '2', '3', '10'];
      final result = list.min((a, b) => int.parse(a).compareTo(int.parse(b)));
      expect(result, '0');
    });

    test('Error: on empty list', () {
      final list = <int>[];
      final task = () => list.min();
      expect(task, throwsA(isA<StateError>()));
    });

    test('Error: on unsupported type with no comparer', () {
      var list = [Symbol.empty, Symbol.empty];
      var task = () => list.min();
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
