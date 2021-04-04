import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('shake', () {
    test('on ints', () {
      final list = Iterable.generate(1000, (i) => i);
      final randomized1 = list.shake();
      expect(randomized1.length, list.length);
      for (var i in randomized1) {
        expect(list.contains(i), isTrue);
      }
      expect(randomized1, isNot(equals(list)));
      final randomized2 = list.shake();
      expect(randomized1, isNot(equals(randomized2)));
    });
  });
}
