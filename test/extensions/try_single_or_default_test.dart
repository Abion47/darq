import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('trySingleOrDefault', () {
    test('on empty list', () {
      final list = [];
      final result = list.trySingleOrDefault();
      expect(result, isNull);
    });

    test('on empty list with default value', () {
      final list = [];
      final result = list.trySingleOrDefault(defaultValue: 3);
      expect(result, equals(3));
    });

    test('on list with one element', () {
      final list = [0];
      final result = list.trySingleOrDefault();
      expect(result, equals(0));
    });

    test('try on list with more than one element', () {
      final list = [0, 1];
      final result = list.trySingleOrDefault(defaultValue: 3);
      expect(result, equals(3));
    });
  });
}
