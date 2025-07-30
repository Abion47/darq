import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('insertWhere', () {
    test('Insert a value when an element matches condition', () {
      final list = ['a', 'b', 'c'];
      final result = list.insertWhere('e', (e) => e == 'c');
      expect(result, orderedEquals(['a', 'b', 'e', 'c']));

      final list2 = ['a', 'b', 'd'];
      final result2 = list2.insertWhere('e', (e) => e == 'c');
      expect(result2, orderedEquals(['a', 'b', 'd']));
    });

    test('Insert into short lists', () {
      var list = ['a'];
      var result = list.insertWhere('e', (e) => e == 'c');
      expect(result, orderedEquals(['a']));

      var list2 = <String>[];
      var result2 = list2.insertWhere('e', (e) => e == 'c');
      expect(result2, orderedEquals([]));
    });
  });
}
