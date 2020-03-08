import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('exclude', () {
    test('Exclude object', () {
      final list = ['a', 'b', 'c', 'd', 'a', 'b'];
      final result = list.exclude('a');
      expect(result, orderedEquals(['b', 'c', 'd', 'b']));
    });

    test('No object match', () {
      final list = ['a', 'b', 'c', 'd', 'a', 'b'];
      final result = list.exclude('e');
      expect(result, orderedEquals(['a', 'b', 'c', 'd', 'a', 'b']));
    });
  });
}
