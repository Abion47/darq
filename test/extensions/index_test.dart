import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('index', () {
    test('Generate indices', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.index();
      expect(result.length, 4);
      expect(result.elementAt(0).key, 0);
      expect(result.elementAt(0).value, 'a');
      expect(result.elementAt(1).key, 1);
      expect(result.elementAt(1).value, 'b');
      expect(result.elementAt(2).key, 2);
      expect(result.elementAt(2).value, 'c');
      expect(result.elementAt(3).key, 3);
      expect(result.elementAt(3).value, 'd');
    });
  });
}
