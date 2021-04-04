import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('lagSelect', () {
    test('Positive offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lagSelect(2, (a, b) => '$a$b', defaultValue: 'e');
      expect(result, orderedEquals(<String>['ae', 'be', 'ca', 'db']));
    });

    test('Negative offset with default value', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.lagSelect(-2, (a, b) => '$a$b', defaultValue: 'e');
      expect(result, orderedEquals(<String>['ae', 'be', 'ca', 'db']));
    });
  });
}
