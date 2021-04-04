import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('RepeatIterable', () {
    test('Creating a repeat iterable', () {
      var value = 'abc';
      var e = RepeatIterable(value, 3);
      expect(e, isA<Iterable<String>>());
      expect(e, orderedEquals(<String>[value, value, value]));
    });

    test('Creating a repeat iterable with zero count', () {
      var e = RepeatIterable('abc', 0);
      expect(e, isA<Iterable<Object>>());
      expect(e, orderedEquals(<String>[]));
    });

    test('Error: negative count', () {
      final task = () => RepeatIterable('abc', -1);
      expect(task, throwsA(isA<AssertionError>()));
    });
  });
}
