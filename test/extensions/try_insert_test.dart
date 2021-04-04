import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tryInsert', () {
    test('Insert one value', () {
      Iterable<int> list = [0, 1, 2, 3];
      var result = list.tryInsert(2, 4);
      expect(result, orderedEquals(<int>[0, 1, 4, 2, 3]));
    });

    test('Insert two values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert2(2, 4, 5);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 2, 3]));
    });

    test('Insert three values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert3(2, 4, 5, 6);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 2, 3]));
    });

    test('Insert four values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert4(2, 4, 5, 6, 7);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 2, 3]));
    });

    test('Insert five values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert5(2, 4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 2, 3]));
    });

    test('Insert six values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert6(2, 4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 2, 3]));
    });

    test('Insert seven values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert7(2, 4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 2, 3]));
    });

    test('Insert eight values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert8(2, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(
          result, orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 2, 3]));
    });

    test('Insert nine values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert9(2, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result,
          orderedEquals(<int>[0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 2, 3]));
    });

    test('Try insert one value', () {
      Iterable<int> list = [0, 1, 2, 3];
      var result = list.tryInsert(5, 4);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('Try insert two values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert2(5, 4, 5);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('Try insert three values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert3(5, 4, 5, 6);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('Try insert four values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert4(5, 4, 5, 6, 7);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('Try insert five values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert5(5, 4, 5, 6, 7, 8);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('Try insert six values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert6(5, 4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('Try insert seven values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert7(5, 4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('Try insert eight values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert8(5, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('Try insert nine values', () {
      var list = [0, 1, 2, 3];
      var result = list.tryInsert9(5, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });
  });
}
