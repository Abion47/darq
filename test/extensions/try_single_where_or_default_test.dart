import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('trySingleWhereOrDefault', () {
    test('on empty list', () {
      final list = [];
      final result = list.trySingleWhereOrDefault((x) => x == 2);
      expect(result, isNull);
    });

    test('on list with no matching elements', () {
      final list = [0, 1];
      final result = list.trySingleWhereOrDefault((x) => x == 2);
      expect(result, isNull);
    });

    test('on list with one matching element', () {
      final list = [0, 1, 2];
      final result = list.trySingleWhereOrDefault((x) => x == 2);
      expect(result, 2);
    });

    test('on empty list with default value', () {
      final list = [];
      final result =
          list.trySingleWhereOrDefault((x) => x == 2, defaultValue: 3);
      expect(result, equals(3));
    });

    test('on list with no matching elements and default value', () {
      final list = [0, 1];
      final result =
          list.trySingleWhereOrDefault((x) => x == 2, defaultValue: 3);
      expect(result, 3);
    });

    test('try on list with more than one matching element', () {
      final list = [0, 1, 2, 2];
      final result =
          list.trySingleWhereOrDefault((x) => x == 2, defaultValue: 3);
      expect(result, 3);
    });
  });
}
