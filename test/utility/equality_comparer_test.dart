import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/person.dart';

void main() {
  group('EqualityComparer', () {
    test('Default comparers', () {
      // dynamic
      final dynamicList = <dynamic>[0, 'a', true];
      final dynamicResult =
          dynamicList.orderBy<dynamic>((dynamic e) => e).toList();

      expect(dynamicResult, orderedEquals(<dynamic>[0, 'a', true]));

      // DateTime
      final durationList = [
        const Duration(days: 1),
        const Duration(minutes: 1),
        const Duration(hours: 1),
      ];
      final durationResult = durationList.orderBy((e) => e).toList();

      expect(
        durationResult,
        orderedEquals(<Duration>[
          const Duration(minutes: 1),
          const Duration(hours: 1),
          const Duration(days: 1),
        ]),
      );

      // DateTime
      final dateTimeList = [
        DateTime(2100),
        DateTime(1900),
        DateTime(2000),
      ];
      final dateTimeResult = dateTimeList.orderBy((e) => e).toList();

      expect(
        dateTimeResult,
        orderedEquals(<DateTime>[
          DateTime(1900),
          DateTime(2000),
          DateTime(2100),
        ]),
      );

      // BigInt
      final bigIntList = [
        BigInt.parse('2457234562345234645745'),
        BigInt.zero,
        BigInt.from(5000),
      ];
      final bigIntResult = bigIntList.orderBy((e) => e).toList();

      expect(
        bigIntResult,
        orderedEquals(<BigInt>[
          BigInt.zero,
          BigInt.from(5000),
          BigInt.parse('2457234562345234645745'),
        ]),
      );

      // String
      final stringList = ['bbb', 'aaa', 'ccc'];
      final stringResult = stringList.orderBy((e) => e).toList();

      expect(stringResult, orderedEquals(<String>['aaa', 'bbb', 'ccc']));

      // num
      final numList = [2, 1.1, 0x5];
      final numResult = numList.orderBy((e) => e).toList();

      expect(numResult, orderedEquals(<num>[1.1, 2, 0x5]));

      // int
      final intList = [2, 1, 3];
      final intResult = intList.orderBy((e) => e).toList();

      expect(intResult, orderedEquals(<int>[1, 2, 3]));

      // double
      final doubleList = [2.1, 1.4, 3.9];
      final doubleResult = doubleList.orderBy((e) => e).toList();

      expect(doubleResult, orderedEquals(<double>[1.4, 2.1, 3.9]));
    });

    test('Default behavior', () {
      final list = [4, 2, 3, 1];

      final result =
          list.orderBy((e) => e, keyComparer: EqualityComparer<int>()).toList();
      expect(result, orderedEquals(<int>[4, 2, 3, 1]));

      final result2 = list
          .orderBy((e) => e, keyComparer: EqualityComparer.forType<int>())
          .toList();
      expect(result2, orderedEquals(<int>[1, 2, 3, 4]));
    });

    test('Custom handlers', () {
      final list = [
        const {'name': 'James', 'age': 15},
        const {'name': 'Bob', 'age': 29},
        const {'name': 'Phil', 'age': 8},
      ];

      final comparer = EqualityComparer(
        comparer: (Map<String, Object> left, Map<String, Object> right) =>
            left['name'] == right['name'],
        hasher: (Map<String, Object> obj) => obj.hashCode,
        sorter: (Map<String, Object> left, Map<String, Object> right) =>
            (left['name'] as String).compareTo(right['name'] as String),
      );

      final result = list.orderBy((e) => e, keyComparer: comparer);
      expect(
        result,
        orderedEquals(<Map<String, Object>>[
          const {'name': 'Bob', 'age': 29},
          const {'name': 'James', 'age': 15},
          const {'name': 'Phil', 'age': 8},
        ]),
      );
    });

    test('Comparable interop', () {
      final list = [
        const Person('James'),
        const Person('Bob'),
        const Person('Phil'),
      ];

      EqualityComparer.registerEqualityComparer(EqualityComparer.of<Person>());
      final result = list.orderBy((e) => e);

      expect(
        result,
        orderedEquals(<Person>[
          const Person('Bob'),
          const Person('James'),
          const Person('Phil'),
        ]),
      );
    });
  });
}
