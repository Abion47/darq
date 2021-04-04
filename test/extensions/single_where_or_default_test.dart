import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('singleWhereOrDefault', () {
    test('on empty list', () {
      final list = <int>[];
      final result = list.singleWhereOrDefault((x) => x == 2, defaultValue: 3);
      expect(result, 3);
    });

    test('on list with no matching elements', () {
      final list = [0, 1];
      final result = list.singleWhereOrDefault((x) => x == 2, defaultValue: 3);
      expect(result, 3);
    });

    test('on list with one matching element', () {
      final list = [0, 1, 2];
      final result = list.singleWhereOrDefault((x) => x == 2, defaultValue: 3);
      expect(result, 2);
    });

    test('Error: on list with more than one matching element', () {
      final list = [0, 1, 2, 2];
      final task =
          () => list.singleWhereOrDefault((x) => x == 2, defaultValue: 3);
      expect(task, throwsA(isA<StateError>()));
    });
  });
}
