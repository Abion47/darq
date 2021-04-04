import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('prepend', () {
    test('Prepend one value', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend(4);
      expect(result, orderedEquals(<int>[4, 0, 1, 2, 3]));
    });

    test('Prepend two values', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend2(4, 5);
      expect(result, orderedEquals(<int>[4, 5, 0, 1, 2, 3]));
    });

    test('Prepend three values', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend3(4, 5, 6);
      expect(result, orderedEquals(<int>[4, 5, 6, 0, 1, 2, 3]));
    });

    test('Prepend four values', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend4(4, 5, 6, 7);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 0, 1, 2, 3]));
    });

    test('Prepend five values', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend5(4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 0, 1, 2, 3]));
    });

    test('Prepend six values', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend6(4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 0, 1, 2, 3]));
    });

    test('Prepend seven values', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend7(4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 0, 1, 2, 3]));
    });

    test('Prepend eight values', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend8(4, 5, 6, 7, 8, 9, 10, 11);
      expect(
          result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3]));
    });

    test('Prepend nine values', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend9(4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result,
          orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 11, 12, 0, 1, 2, 3]));
    });
  });
}
