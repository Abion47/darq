import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('insert', () {
    test('Insert one value', () {
      Iterable<int> list = [0, 1, 2, 3];
      var result = list.insert(2, 4);
      expect(result, orderedEquals([0, 1, 4, 2, 3]));
    });

    test('Insert two values', () {
      var list = [0, 1, 2, 3];
      var result = list.insert2(2, 4, 5);
      expect(result, orderedEquals([0, 1, 4, 5, 2, 3]));
    });

    test('Insert three values', () {
      var list = [0, 1, 2, 3];
      var result = list.insert3(2, 4, 5, 6);
      expect(result, orderedEquals([0, 1, 4, 5, 6, 2, 3]));
    });

    test('Insert four values', () {
      var list = [0, 1, 2, 3];
      var result = list.insert4(2, 4, 5, 6, 7);
      expect(result, orderedEquals([0, 1, 4, 5, 6, 7, 2, 3]));
    });

    test('Insert five values', () {
      var list = [0, 1, 2, 3];
      var result = list.insert5(2, 4, 5, 6, 7, 8);
      expect(result, orderedEquals([0, 1, 4, 5, 6, 7, 8, 2, 3]));
    });

    test('Insert six values', () {
      var list = [0, 1, 2, 3];
      var result = list.insert6(2, 4, 5, 6, 7, 8, 9);
      expect(result, orderedEquals([0, 1, 4, 5, 6, 7, 8, 9, 2, 3]));
    });

    test('Insert seven values', () {
      var list = [0, 1, 2, 3];
      var result = list.insert7(2, 4, 5, 6, 7, 8, 9, 10);
      expect(result, orderedEquals([0, 1, 4, 5, 6, 7, 8, 9, 10, 2, 3]));
    });

    test('Insert eight values', () {
      var list = [0, 1, 2, 3];
      var result = list.insert8(2, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(result, orderedEquals([0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 2, 3]));
    });

    test('Insert nine values', () {
      var list = [0, 1, 2, 3];
      var result = list.insert9(2, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(result, orderedEquals([0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 2, 3]));
    });

    test('Error: Append one value', () {
      Iterable<int> list = [0, 1, 2, 3];
      var task = () => list.insert(5, 4);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Append two values', () {
      var list = [0, 1, 2, 3];
      var task = () => list.insert2(5, 4, 5);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Append three values', () {
      var list = [0, 1, 2, 3];
      var task = () => list.insert3(5, 4, 5, 6);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Append four values', () {
      var list = [0, 1, 2, 3];
      var task = () => list.insert4(5, 4, 5, 6, 7);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Append five values', () {
      var list = [0, 1, 2, 3];
      var task = () => list.insert5(5, 4, 5, 6, 7, 8);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Append six values', () {
      var list = [0, 1, 2, 3];
      var task = () => list.insert6(5, 4, 5, 6, 7, 8, 9);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Append seven values', () {
      var list = [0, 1, 2, 3];
      var task = () => list.insert7(5, 4, 5, 6, 7, 8, 9, 10);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Append eight values', () {
      var list = [0, 1, 2, 3];
      var task = () => list.insert8(5, 4, 5, 6, 7, 8, 9, 10, 11);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Append nine values', () {
      var list = [0, 1, 2, 3];
      var task = () => list.insert9(5, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
