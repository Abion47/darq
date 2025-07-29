import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('insertOrAppend', () {
    test('Insert one value', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend(2, 4);
      expect(result, orderedEquals(<int>[0, 1, 4, 2, 3]));

      result = list.insertOrAppend(0, 4);
      expect(result, orderedEquals(<int>[4, 0, 1, 2, 3]));
    });

    test('Insert two values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend2(2, 4, 5);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 2, 3]));

      result = list.insertOrAppend2(0, 4, 5);
      expect(result, orderedEquals(<int>[4, 5, 0, 1, 2, 3]));
    });

    test('Insert three values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend3(2, 4, 5, 6);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 2, 3]));

      result = list.insertOrAppend3(0, 4, 5, 6);
      expect(result, orderedEquals(<int>[4, 5, 6, 0, 1, 2, 3]));
    });

    test('Insert four values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend4(2, 4, 5, 6, 7);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 2, 3]));

      result = list.insertOrAppend4(0, 4, 5, 6, 7);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 0, 1, 2, 3]));
    });

    test('Insert five values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend5(2, 4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 2, 3]));

      result = list.insertOrAppend5(0, 4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 0, 1, 2, 3]));
    });

    test('Insert six values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend6(2, 4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 2, 3]));

      result = list.insertOrAppend6(0, 4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 0, 1, 2, 3]));
    });

    test('Insert seven values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend7(2, 4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 2, 3]));

      result = list.insertOrAppend7(0, 4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 0, 1, 2, 3]));
    });

    test('Insert eight values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend8(2, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(
          result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 2, 3]));

      result = list.insertOrAppend8(0, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(
          result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3]));
    });

    test('Insert nine values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend9(2, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result,
          orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 2, 3]));

      result = list.insertOrAppend9(0, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result,
          orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 11, 12, 0, 1, 2, 3]));
    });

    test('Append one value', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend(5, 4);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4]));
    });

    test('Append two values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend2(5, 4, 5);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5]));
    });

    test('Append three values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend3(5, 4, 5, 6);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6]));
    });

    test('Append four values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend4(5, 4, 5, 6, 7);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7]));
    });

    test('Append five values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend5(5, 4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8]));
    });

    test('Append six values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend6(5, 4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
    });

    test('Append seven values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend7(5, 4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
    });

    test('Append eight values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend8(5, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(
          result, orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]));
    });

    test('Append nine values', () {
      var list = [0, 1, 2, 3];
      var result = list.insertOrAppend9(5, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result,
          orderedEquals(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]));
    });

    test('Error: Index less than zero (one value)', () {
      Iterable<int> list = [0, 1, 2, 3];
      void task() => list.insertOrAppend(-1, 4);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Index less than zero (two values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.insertOrAppend2(-1, 4, 5);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Index less than zero (three values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.insertOrAppend3(-1, 4, 5, 6);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Index less than zero (four values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.insertOrAppend4(-1, 4, 5, 6, 7);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Index less than zero (five values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.insertOrAppend5(-1, 4, 5, 6, 7, 8);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Index less than zero (six values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.insertOrAppend6(-1, 4, 5, 6, 7, 8, 9);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Index less than zero (seven values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.insertOrAppend7(-1, 4, 5, 6, 7, 8, 9, 10);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Index less than zero (eight values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.insertOrAppend8(-1, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Index less than zero (nine values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.insertOrAppend9(-1, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
