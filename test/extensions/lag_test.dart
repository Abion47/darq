import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('lag', () {
    test('Positive offset', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lag(2);
      expect(result.length, 4);
      expect(result.elementAt(0), ['a', null]);
      expect(result.elementAt(1), ['b', null]);
      expect(result.elementAt(2), ['c', 'a']);
      expect(result.elementAt(3), ['d', 'b']);
    });

    test('Positive offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lag(2, defaultValue: 'e');
      expect(result.length, 4);
      expect(result.elementAt(0), ['a', 'e']);
      expect(result.elementAt(1), ['b', 'e']);
      expect(result.elementAt(2), ['c', 'a']);
      expect(result.elementAt(3), ['d', 'b']);
    });

    test('Negative offset', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lag(-2);
      expect(result.length, 4);
      expect(result.elementAt(0), ['a', null]);
      expect(result.elementAt(1), ['b', null]);
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
