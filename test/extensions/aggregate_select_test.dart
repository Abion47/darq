import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('aggregateSelect', () {
    test('on ints: addition', () {
      var list = [0, 1, 2, 3, 4];
      var result = list.aggregateSelect<int>(0, (a, b) => a + b);
      expect(result, equals(10));
    });

    test('on ints: multiplication', () {
      final list = [2, 2, 2, 2, 2, 2, 2, 2];
      final result = list.aggregateSelect<int>(1, (a, b) => a * b);
      expect(result, equals(256));
    });

    test('on Strings', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.aggregateSelect<String>('', (a, b) => a + b);
      expect(result, equals('abcde'));
    });

    test('on Strings with starting value', () {
      final list = ['a', 'b', 'c', 'd', 'e'];
      final result = list.aggregateSelect<String>('xyz', (a, b) => a + b);
      expect(result, equals('xyzabcde'));
    });

    test('on empty list', () {
      final list = <String>[];
      final result = list.aggregateSelect<String>('xyz', (a, b) => a + b);
      expect(result, equals('xyz'));
    });
  });
}
