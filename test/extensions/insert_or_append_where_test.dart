import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('insertOrAppendWhere', () {
    test('Insert a value when an element matches condition', () {
      final list = ['a', 'b', 'c'];
      final result = list.insertOrAppendWhere('e', (e) => e == 'c');
      expect(result, orderedEquals(['a', 'b', 'e', 'c']));

      final list2 = ['a', 'b', 'd'];
      final result2 = list2.insertOrAppendWhere('e', (e) => e == 'c');
      expect(result2, orderedEquals(['a', 'b', 'd', 'e']));
    });

    test('Insert into short lists', () {
      var list = ['a'];
      var result = list.insertOrAppendWhere('e', (e) => e == 'c');
      expect(result, orderedEquals(['a', 'e']));

      var list2 = <String>[];
      var result2 = list2.insertOrAppendWhere('e', (e) => e == 'c');
      expect(result2, orderedEquals(['e']));
    });
  });
}
