import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('append', () {
    test('Append one value', () {
      var list = [0, 1, 2, 3];
      var result = list.append(4);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4]));
    });

    test('Append two values', () {
      var list = [0, 1, 2, 3];
      var result = list.append2(4, 5);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5]));
    });

    test('Append three values', () {
      var list = [0, 1, 2, 3];
      var result = list.append3(4, 5, 6);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6]));
    });

    test('Append four values', () {
      var list = [0, 1, 2, 3];
      var result = list.append4(4, 5, 6, 7);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7]));
    });

    test('Append five values', () {
      var list = [0, 1, 2, 3];
      var result = list.append5(4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8]));
    });

    test('Append six values', () {
      var list = [0, 1, 2, 3];
      var result = list.append6(4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
    });

    test('Append seven values', () {
      var list = [0, 1, 2, 3];
      var result = list.append7(4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
    });

    test('Append eight values', () {
      var list = [0, 1, 2, 3];
      var result = list.append8(4, 5, 6, 7, 8, 9, 10, 11);
      expect(
          result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]));
    });

    test('Append nine values', () {
      var list = [0, 1, 2, 3];
      var result = list.append9(4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result,
          orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]));
    });
  });
}
