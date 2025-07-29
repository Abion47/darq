import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('memoize', () {
    test('Non-memoized list', () {
      final list = ['a'];
      var called = 0;
      final generator = list.map((c) {
        called++;
        return c.length;
      });

      final result = generator.toList();
      expect(result, orderedEquals(<int>[1]));

      generator.consume();
      generator.consume();
      expect(called, 3);
    });

    test('Memoized list', () {
      final list = ['a'];
      var called = 0;
      final generator = list.map((c) {
        called++;
        return c.length;
      }).memoize();

      final result = generator.toList();
      expect(result, orderedEquals(<int>[1]));

      generator.consume();
      generator.consume();
      expect(called, 1);
    });

    test('Memoized list (unmodifiable)', () {
      final list = ['a'];
      var called = 0;
      final generator = list.map((c) {
        called++;
        return c.length;
      }).memoize();

      final result = generator.toList(growable: false);
      expect(result, orderedEquals(<int>[1]));

      generator.consume();
      generator.consume();
      expect(called, 1);

      void task() => result.add(5);
      expect(task, throwsA(isA<UnsupportedError>()));
    });
  });
}
