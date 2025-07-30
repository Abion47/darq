import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('Lookup', () {
    test('createFromMap', () {
      final map = {'a': 1, 'b': 2, 'c': 3};
      final lookup = Lookup.createFromMap(map);

      expect(lookup.comparer, EqualityComparer.forType<String>());
      expect(lookup.count, 3);
      expect(lookup.groupings, hasLength(7));
    });

    test('indexer assign', () {
      final map = {'a': 1, 'b': 2, 'c': 3};
      final lookup = Lookup.createFromMap(map);

      expect(lookup.count, 3);
      expect(lookup.getGrouping('a', false), orderedEquals([1]));

      lookup['a'] = 4;

      expect(lookup.count, 3);
      expect(lookup.getGrouping('a', false), orderedEquals([1, 4]));

      lookup['d'] = 5;

      expect(lookup.count, 4);
      expect(lookup.getGrouping('d', false), orderedEquals([5]));
    });

    test('containsKey', () {
      final map = {'a': 1, 'b': 2, 'c': 3};
      final lookup = Lookup.createFromMap(map);

      expect(lookup.containsKey('a'), isTrue);
      expect(lookup.containsKey('b'), isTrue);
      expect(lookup.containsKey('c'), isTrue);
      expect(lookup.containsKey('d'), isFalse);
    });
  });
}
