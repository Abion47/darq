import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('Grouping', () {
    final list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    final groups = list.groupBy((e) => e % 2).toMap((e) => MapEntry(e.key, e));

    test('indexer', () {
      final group = groups[0]!;

      expect(group.key, 0);
      expect(group[2], 4);
    });

    test('hashCode', () {
      final group = groups[0]!;

      expect(group.key, 0);
      expect(group.hashCode, Object.hashAll(group.elements));
    });

    test('containsValue', () {
      final group = groups[0]!;

      expect(group.key, 0);
      expect(group.containsValue(4), isTrue);
      expect(group.containsValue(5), isFalse);
    });

    test('indexOf', () {
      final group = groups[0]!;

      expect(group.key, 0);
      expect(group.indexOf(4), 2);
      expect(group.indexOf(5), -1);
    });

    test('toString', () {
      final group = groups[0]!;

      expect(group.key, 0);
      expect(group.toString(), '{0: [0, 2, 4, 6, 8]}');
    });
  });
}
