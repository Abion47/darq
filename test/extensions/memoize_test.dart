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
      generator.consume();
      generator.consume();
      final result = generator.toList();
      expect(result, orderedEquals(<int>[1]));
      expect(called, 3);
    });

    test('Memoized list', () {
      final list = ['a'];
      var called = 0;
      final generator = list.map((c) {
        called++;
        return c.length;
      }).memoize();
      generator.consume();
      generator.consume();
      final result = generator.toList();
      expect(result, orderedEquals(<int>[1]));
      expect(called, 1);
    });
  });
}
