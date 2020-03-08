import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('aggregateRightSelect', () {
    test('on ints: addition', () {
      var list = [0, 1, 2, 3, 4];
      var result = list.aggregateRightSelect(0, (a, b) => a + b);
      expect(result, equals(10));
    });

    test('on ints: multiplication', () {
      final list = [2, 2, 2, 2, 2, 2, 2, 2];
      final result = list.aggregateRightSelect(1, (a, b) => a * b);
      expect(result, equals(256));
    });

    test('on Strings', () {
      final list = ['a', 'b', 'c'];
      final result = list.aggregateRightSelect('', (a, b) => '$a$b');
      expect(result, equals('cba'));
    });

    test('on Strings with starting value', () {
      final list = ['a', 'b', 'c'];
      final result = list.aggregateRightSelect('d', (a, b) => '($b, $a)');
      expect(result, equals('(a, (b, (c, d)))'));
    });

    test('on empty list', () {
      final list = [];
      final result = list.aggregateRightSelect('xyz', (a, b) => a + b);
      expect(result, equals('xyz'));
    });

    test('Error: null aggregator', () {
      final list = [0, 1, 2, 3, 4];
      final task = () => list.aggregateRightSelect(0, null);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
