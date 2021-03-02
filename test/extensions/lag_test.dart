import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('lag', () {
    test('Positive offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lag(2, defaultValue: 'e');
      expect(result.length, 4);
      expect(result.elementAt(0), ['a', 'e']);
      expect(result.elementAt(1), ['b', 'e']);
      expect(result.elementAt(2), ['c', 'a']);
      expect(result.elementAt(3), ['d', 'b']);
    });

    test('Negative offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lag(-2, defaultValue: 'e');
      expect(result.length, 4);
      expect(result.elementAt(0), ['a', 'e']);
      expect(result.elementAt(1), ['b', 'e']);
      expect(result.elementAt(2), ['c', 'a']);
      expect(result.elementAt(3), ['d', 'b']);
    });
  });
}
