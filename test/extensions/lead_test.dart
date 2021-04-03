import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('lead', () {
    test('Positive offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lead(2, defaultValue: 'e');
      expect(result.length, 4);
      expect(result.elementAt(0), ['a', 'c']);
      expect(result.elementAt(1), ['b', 'd']);
      expect(result.elementAt(2), ['c', 'e']);
      expect(result.elementAt(3), ['d', 'e']);
    });

    test('Negative offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lead(-2, defaultValue: 'e');
      expect(result.length, 4);
      expect(result.elementAt(0), ['a', 'c']);
      expect(result.elementAt(1), ['b', 'd']);
      expect(result.elementAt(2), ['c', 'e']);
      expect(result.elementAt(3), ['d', 'e']);
    });
  });
}
