import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('aggregateRightSelect', () {
    test('on ints: addition', () {
      var list = [0, 1, 2, 3, 4];
      var result = list.aggregateRightSelect<int>(0, (a, b) => a + b);
      expect(result, equals(10));
    });

    test('on ints: multiplication', () {
      final list = [2, 2, 2, 2, 2, 2, 2, 2];
      final result = list.aggregateRightSelect<int>(1, (a, b) => a * b);
      expect(result, equals(256));
    });

    test('on Strings', () {
      final list = ['a', 'b', 'c'];
      final result = list.aggregateRightSelect<String>('', (a, b) => '$a$b');
      expect(result, equals('cba'));
    });

    test('on Strings with starting value', () {
      final list = ['a', 'b', 'c'];
      final result =
          list.aggregateRightSelect<String>('d', (a, b) => '($b, $a)');
      expect(result, equals('(a, (b, (c, d)))'));
    });

    test('on empty list', () {
      final list = <String>[];
      final result = list.aggregateRightSelect<String>('xyz', (a, b) => a + b);
      expect(result, equals('xyz'));
    });
  });
}
