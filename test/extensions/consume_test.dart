import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('consume', () {
    test('Consume iterable', () {
      final list = ['a'];
      var called = false;
      list.map((c) {
        called = true;
        return c;
      }).consume();
      expect(called, isTrue);
    });
  });
}
