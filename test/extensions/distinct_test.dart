import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('distinct', () {
    test('on ints', () {
      final list = [0, 1, 1, 2, 2, 2, 3, 4, 4, 4, 4, 4, 4];
      final result = list.distinct();
      expect(result, orderedEquals([0, 1, 2, 3, 4]));
    });

    test('on ints: already distinct', () {
      final list = <int>[0, 1, 2, 3, 4];
      final result = list.distinct();
      expect(result, orderedEquals([0, 1, 2, 3, 4]));
    });

    test('on Strings', () {
      final list = ['a', 'b', 'c', 'a', 'b', 'c'];
      final result = list.distinct();
      expect(result, orderedEquals(['a', 'b', 'c']));
    });

    test('on Strings with condition', () {
      final list = ['a', 'b', 'c', 'A', 'B', 'C'];
      final result = list.distinct((s) => s.toLowerCase().hashCode);
      expect(result, orderedEquals(['a', 'b', 'c']));
    });
  });
}
