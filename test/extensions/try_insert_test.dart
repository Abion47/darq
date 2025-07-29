import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tryInsert', () {
    test('Insert one value', () {
      Iterable<int> list = [0, 1, 2, 3];

      var result = list.tryInsert(2, 4);
      expect(result, orderedEquals(<int>[0, 1, 4, 2, 3]));

      result = list.tryInsert(0, 4);
      expect(result, orderedEquals(<int>[4, 0, 1, 2, 3]));
    });

    test('Insert two values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert2(2, 4, 5);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 2, 3]));

      result = list.tryInsert2(0, 4, 5);
      expect(result, orderedEquals(<int>[4, 5, 0, 1, 2, 3]));
    });

    test('Insert three values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert3(2, 4, 5, 6);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 2, 3]));

      result = list.tryInsert3(0, 4, 5, 6);
      expect(result, orderedEquals(<int>[4, 5, 6, 0, 1, 2, 3]));
    });

    test('Insert four values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert4(2, 4, 5, 6, 7);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 2, 3]));

      result = list.tryInsert4(0, 4, 5, 6, 7);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 0, 1, 2, 3]));
    });

    test('Insert five values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert5(2, 4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 2, 3]));

      result = list.tryInsert5(0, 4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 0, 1, 2, 3]));
    });

    test('Insert six values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert6(2, 4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 2, 3]));

      result = list.tryInsert6(0, 4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 0, 1, 2, 3]));
    });

    test('Insert seven values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert7(2, 4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 2, 3]));

      result = list.tryInsert7(0, 4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 0, 1, 2, 3]));
    });

    test('Insert eight values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert8(2, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(
          result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 2, 3]));

      result = list.tryInsert8(0, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(
          result, orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3]));
    });

    test('Insert nine values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert9(2, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result,
          orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 2, 3]));

      result = list.tryInsert9(0, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result,
          orderedEquals(<int>[4, 5, 6, 7, 8, 9, 10, 11, 12, 0, 1, 2, 3]));
    });

    test('Error: index less than zero (one value)', () {
      Iterable<int> list = [0, 1, 2, 3];
      void task() => list.tryInsert(-1, 4);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero (two values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.tryInsert2(-1, 4, 5);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero (three values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.tryInsert3(-1, 4, 5, 6);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero (four values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.tryInsert4(-1, 4, 5, 6, 7);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero (five values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.tryInsert5(-1, 4, 5, 6, 7, 8);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero (six values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.tryInsert6(-1, 4, 5, 6, 7, 8, 9);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero (seven values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.tryInsert7(-1, 4, 5, 6, 7, 8, 9, 10);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero (eight values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.tryInsert8(-1, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero (nine values)', () {
      var list = [0, 1, 2, 3];
      void task() => list.tryInsert9(-1, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
