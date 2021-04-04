import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('leadSelect', () {
    test('Positive offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.leadSelect(2, (a, b) => '$a$b', defaultValue: 'e');
      expect(result, orderedEquals(<String>['ac', 'bd', 'ce', 'de']));
    });

    test('Negative offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.leadSelect(-2, (a, b) => '$a$b', defaultValue: 'e');
      expect(result, orderedEquals(<String>['ac', 'bd', 'ce', 'de']));
    });
  });
}
