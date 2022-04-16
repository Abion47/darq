import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('Extension Methods', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.sum();
      expect(result, 15);
      expect(result, isA<int>());
    });

    test('on doubles', () {
      final list = [1.0, 2.0, 3.0, 4.0, 5.0];
      final result = list.sum<double>();
      expect(result, 15);
      expect(result, isA<double>());
    });

    test('on Strings with selector', () {
      final list = ['1', '2', '3', '4', '5'];
      final result = list.sum<int>((x) => int.parse(x));
      expect(result, 15);
    });

    test('on empty list', () {
      final list = <int>[];
      final result = list.sum();
      expect(result, 0);
    });

    test('Error: on unsupported type with no selector', () {
      final list = [true, false];
      final result = () => list.sum();
      expect(result, throwsA(isA<ArgumentError>()));
    });
  });
}
