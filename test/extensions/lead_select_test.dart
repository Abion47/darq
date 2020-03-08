import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('leadSelect', () {
    test('Positive offset', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.leadSelect(2, (a, b) => '$a$b');
      expect(result, orderedEquals(['ac', 'bd', 'cnull', 'dnull']));
    });

    test('Positive offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.leadSelect(2, (a, b) => '$a$b', defaultValue: 'e');
      expect(result, orderedEquals(['ac', 'bd', 'ce', 'de']));
    });

    test('Negative offset', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.leadSelect(-2, (a, b) => '$a$b');
      expect(result, orderedEquals(['ac', 'bd', 'cnull', 'dnull']));
    });

    test('Negative offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.leadSelect(-2, (a, b) => '$a$b', defaultValue: 'e');
      expect(result, orderedEquals(['ac', 'bd', 'ce', 'de']));
    });
  });
}
