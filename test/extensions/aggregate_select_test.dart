import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('aggregateSelect', () {
    test('on ints: addition', () {
      var list = [0, 1, 2, 3, 4];
      var result = list.aggregateSelect(0, (a, b) => a + b);
      expect(result, equals(10));
    });

    test('on ints: multiplication', () {
      final list = [2, 2, 2, 2, 2, 2, 2, 2];
      final result = list.aggregateSelect(1, (a, b) => a * b);
      expect(result, equals(256));
    });

    test('on Strings', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.aggregateSelect('', (a, b) => a + b);
      expect(result, equals('abcde'));
    });

    test('on Strings with starting value', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.aggregateSelect('xyz', (a, b) => a + b);
      expect(result, equals('xyzabcde'));
    });

    test('Error: null aggregator', () {
      final list = [0, 1, 2, 3, 4];
      final task = () => list.aggregateSelect(0, null);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
