import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/person.dart';
import '../fixtures/pet.dart';

void main() {
  group('ofType', () {
    test('of one type', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      final result = test.ofType<int>();
      expect(result, orderedEquals(test.take(1)));
    });

    test('of two types', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      final result = test.ofType2<int, double>();
      expect(result, orderedEquals(test.take(2)));
    });

    test('of three types', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      final result = test.ofType3<int, double, String>();
      expect(result, orderedEquals(test.take(3)));
    });

    test('of four types', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      var result = test.ofType4<int, double, String, bool>();
      expect(result, orderedEquals(test.take(4)));
    });

    test('of five types', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      final result = test.ofType5<int, double, String, bool, List<int>>();
      expect(result, orderedEquals(test.take(5)));
    });

    test('of six types', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      final result =
          test.ofType6<int, double, String, bool, List<int>, Set<String>>();
      expect(result, orderedEquals(test.take(6)));
    });

    test('of seven types', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      final result = test.ofType7<int, double, String, bool, List<int>,
          Set<String>, Map<String, dynamic>>();
      expect(result, orderedEquals(test.take(7)));
    });

    test('of eight types', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      final result = test.ofType8<int, double, String, bool, List<int>,
          Set<String>, Map<String, dynamic>, Pet>();
      expect(result, orderedEquals(test.take(8)));
    });

    test('of nine types', () {
      final test = [
        0,
        1.0,
        '2',
        true,
        <int>[],
        <String>{},
        <String, int>{},
        Pet('Spot', 4),
        Person('Bill'),
        () => <String, dynamic>{},
      ];
      final result = test.ofType9<int, double, String, bool, List<int>,
          Set<String>, Map<String, dynamic>, Pet, Person>();
      expect(result, orderedEquals(test.take(9)));
    });
  });
}
