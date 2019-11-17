import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('Factories', () {
    test('Creating a range iterable', () {
      var e = RangeIterable(2, 5);

      expect(e, isA<Iterable<int>>());
      expect(e, equals([2, 3, 4, 5, 6]));
    });

    test('Creating a repeat enumerable', () {
      var value = 'abc';
      var e = RepeatIterable(value, 3);

      expect(e, isA<Iterable<Object>>());
      expect(e, orderedEquals([value, value, value]));
    });

    test('Creating a string enumerable', () {
      var string = 'abcdef';
      var e = string.iterable;

      expect(e, isA<Iterable<String>>());
      expect(e, orderedEquals(['a', 'b', 'c', 'd', 'e', 'f']));
    });
  });

  group('Extension Methods', () {
    test('aggregate', () {
      var list = [0, 1, 2, 3, 4];
      var result = list.aggregate(0, (a, b) => a + b);
      expect(result, equals(10));

      var list2 = ['a', 'b', 'c', 'd', 'e'];
      var result2 = list2.aggregate('', (a, b) => a + b);
      expect(result2, equals('abcde'));

      var result3 = list2.aggregate('xyz', (a, b) => a + b);
      expect(result3, equals('xyzabcde'));

      var list4 = [2, 2, 2, 2, 2, 2, 2, 2];
      var result4 = list4.aggregate(1, (a, b) => a * b);
      expect(result4, equals(256));
    });

    test('all', () {
      var list = [true, true, true, true];
      var result = list.all();
      expect(result, isTrue);

      var list2 = [true, true, true, false];
      var result2 = list2.all();
      expect(result2, isFalse);

      var list3 = [2, 4, 6, 8];
      var result3 = list3.all((x) => x.isEven);
      expect(result3, isTrue);

      var list4 = [2, 4, 6, 7];
      var result4 = list4.all((x) => x.isEven);
      expect(result4, isFalse);
    });

    test('append', () {
      var list = [0, 1, 2, 3];
      var result = list.append(4);
      expect(result, orderedEquals([0, 1, 2, 3, 4]));
    });

    test('average', () {
      var list = [1, 3, 5, 7, 9];
      var result = list.average();
      expect(result, equals(5.0));

      var list2 = [1, 2];
      var result2 = list2.average();
      expect(result2, equals(1.5));

      var list3 = ['a', 'ab', 'abc'];
      var result3 = list3.average((s) => s.length);
      expect(result3, equals(2.0));
    });

    test('concat', () {
      var list = [0, 1, 2, 3, 4];
      var result = list.concat([5, 6, 7, 8]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8]));
    });

    test('count', () {
      var list = [];
      var result = list.count();
      expect(result, equals(0));

      var list2 = [0, 1, 2, 3, 4, 5];
      var result2 = list2.count();
      expect(result2, equals(6));

      var list3 = [0, 1, 2, 3, 4, 5];
      var result3 = list3.count((i) => i.isEven);
      expect(result3, equals(3));
    });

    test('defaultIfEmpty', () {
      var list = <int>[];
      var result = list.defaultIfEmpty(5);
      expect(result, orderedEquals([5]));

      var list2 = [0, 1, 2, 3, 4];
      var result2 = list2.defaultIfEmpty(5);
      expect(result2, orderedEquals([0, 1, 2, 3, 4]));
    });

    test('distinct', () {
      var list = <int>[0, 1, 2, 3, 4];
      var result = list.distinct();
      expect(result, orderedEquals([0, 1, 2, 3, 4]));

      var list2 = [0, 1, 1, 2, 2, 2, 3, 4, 4, 4, 4, 4, 4];
      var result2 = list2.distinct();
      expect(result2, orderedEquals([0, 1, 2, 3, 4]));

      var list3 = ['a', 'b', 'c', 'A', 'B', 'C'];
      var result3 = list3.distinct((s) => s.toLowerCase().hashCode);
      expect(result3, orderedEquals(['a', 'b', 'c']));
    });

    test('elementAtOrDefault', () {
      var list = <int>[0, 1, 2, 3, 4];

      var result = list.elementAtOrDefault(3);
      expect(result, equals(3));

      var result2 = list.elementAtOrDefault(6);
      expect(result2, isNull);

      var result3 = list.elementAtOrDefault(6, 5);
      expect(result3, equals(5));
    });

    test('except', () {
      var a = [0, 1, 2, 3];
      var b = [2, 3, 4, 5];

      var result = a.except(b);
      expect(result, orderedEquals([0, 1]));

      var result2 = b.except(a);
      expect(result2, orderedEquals([4, 5]));

      var result3 = a.except(a);
      expect(result3, orderedEquals([]));

      var c = ['a', 'b', 'c', 'd'];
      var d = ['C', 'D', 'E', 'F'];

      var result4 = c.except(d);
      expect(result4, orderedEquals(['a', 'b', 'c', 'd']));

      var result5 = c.except(d, (s) => s.toUpperCase());
      expect(result5, orderedEquals(['a', 'b']));

      var result6 = d.except(c, (s) => s.toUpperCase());
      expect(result6, orderedEquals(['E', 'F']));
    });

    test('firstOrDefault', () {
      var test = [0, 1, 2, 3];
      var result = test.firstOrDefault();
      expect(result, 0);

      var test2 = [];
      var result2 = test2.firstOrDefault();
      expect(result2, null);

      var result3 = test2.firstOrDefault(4);
      expect(result3, 4);
    });

    test('firstWhereOrDefault', () {
      var test = [0, 1, 2, 3];
      var result = test.firstWhereOrDefault((i) => i.isOdd);
      expect(result, 1);

      var test2 = [0, 2, 4, 6];
      var result2 = test2.firstWhereOrDefault((i) => i.isOdd);
      expect(result2, null);

      var result3 = test2.firstWhereOrDefault((i) => i.isOdd, 5);
      expect(result3, 5);
    });

    test('groupBy', () {
      final barley = Pet()
        ..name = 'Barley'
        ..age = 8;
      final boots = Pet()
        ..name = 'Boots'
        ..age = 4;
      final whiskers = Pet()
        ..name = 'Whiskers'
        ..age = 1;
      final daisy = Pet()
        ..name = 'Daisy'
        ..age = 4;

      final pets = [barley, boots, whiskers, daisy];

      final results = pets.groupBy((pet) => pet.age);

      expect(results, [
        [
          Pet()
            ..name = 'Barley'
            ..age = 8
        ],
        [
          Pet()
            ..name = 'Boots'
            ..age = 4,
          Pet()
            ..name = 'Daisy'
            ..age = 4
        ],
        [
          Pet()
            ..name = 'Whiskers'
            ..age = 1
        ],
      ]);

      expect(results.elementAt(0).key, 8);
      expect(results.elementAt(1).key, 4);
      expect(results.elementAt(2).key, 1);
    });

    test('groupByValue', () {
      final barley = Pet()
        ..name = 'Barley'
        ..age = 8;
      final boots = Pet()
        ..name = 'Boots'
        ..age = 4;
      final whiskers = Pet()
        ..name = 'Whiskers'
        ..age = 1;
      final daisy = Pet()
        ..name = 'Daisy'
        ..age = 4;

      final pets = [barley, boots, whiskers, daisy];

      final results = pets.groupByValue(
        keySelector: (pet) => pet.age,
        valueSelector: (pet) => pet.name,
      );

      expect(results, [
        ['Barley'],
        ['Boots', 'Daisy'],
        ['Whiskers'],
      ]);

      expect(results.elementAt(0).key, 8);
      expect(results.elementAt(1).key, 4);
      expect(results.elementAt(2).key, 1);
    });

    test('groupJoin', () {
      final travis = Person()..name = 'Travis';
      final terry = Person()..name = 'Terry';
      final charlotte = Person()..name = 'Charlotte';
      final benny = Person()..name = 'Benny';

      final people = [travis, terry, charlotte, benny];

      final barley = Pet()
        ..name = 'Barley'
        ..owner = terry;
      final boots = Pet()
        ..name = 'Boots'
        ..owner = terry;
      final whiskers = Pet()
        ..name = 'Whiskers'
        ..owner = charlotte;
      final daisy = Pet()
        ..name = 'Daisy'
        ..owner = travis;

      final pets = [barley, boots, whiskers, daisy];

      final result = people.groupJoin(
        pets,
        (person, pets) => {
          'ownerName': person.name,
          'pets': pets.select((pet, i) => pet.name)
        },
        outerKeySelector: (person) => person.name,
        innerKeySelector: (pet) => pet.owner.name,
      );

      expect(result, [
        {
          'ownerName': 'Travis',
          'pets': ['Daisy']
        },
        {
          'ownerName': 'Terry',
          'pets': ['Barley', 'Boots']
        },
        {
          'ownerName': 'Charlotte',
          'pets': ['Whiskers']
        },
        {'ownerName': 'Benny', 'pets': []},
      ]);

      final result2 = people.groupJoin(
        pets,
        (person, pets) => {
          'ownerName': person.name,
          'pets': pets.map((pet) => pet.name),
        },
        outerKeySelector: (person) => person.name,
        innerKeySelector: (pet) => pet.owner.name,
        keyComparer: EqualityComparer(
          comparer: (k1, k2) => k1.substring(0, 1) == k2.substring(0, 1),
          hasher: (key) => key.substring(0, 1).hashCode,
        ),
      );

      expect(result2, [
        {
          'ownerName': 'Travis',
          'pets': ['Barley', 'Boots', 'Daisy']
        },
        {
          'ownerName': 'Terry',
          'pets': ['Barley', 'Boots', 'Daisy']
        },
        {
          'ownerName': 'Charlotte',
          'pets': ['Whiskers']
        },
        {'ownerName': 'Benny', 'pets': []},
      ]);
    });

    test('groupSelect', () {
      final barley = Pet()
        ..name = 'Barley'
        ..age = 8.3;
      final boots = Pet()
        ..name = 'Boots'
        ..age = 4.9;
      final whiskers = Pet()
        ..name = 'Whiskers'
        ..age = 1.5;
      final daisy = Pet()
        ..name = 'Daisy'
        ..age = 4.3;

      final pets = [barley, boots, whiskers, daisy];

      final ageComparer = (Pet p1, Pet p2) => p1.age.compareTo(p2.age);

      final result = pets.groupSelect(
        (age, pets) => {
          'key': age,
          'count': pets.length,
          'min': pets.min(ageComparer),
          'max': pets.max(ageComparer),
        },
        keySelector: (pet) => pet.age.floor(),
      );

      expect(result, [
        {
          'key': 8,
          'count': 1,
          'min': Pet()
            ..name = 'Barley'
            ..age = 8.3,
          'max': Pet()
            ..name = 'Barley'
            ..age = 8.3
        },
        {
          'key': 4,
          'count': 2,
          'min': Pet()
            ..name = 'Daisy'
            ..age = 4.3,
          'max': Pet()
            ..name = 'Boots'
            ..age = 4.9
        },
        {
          'key': 1,
          'count': 1,
          'min': Pet()
            ..name = 'Whiskers'
            ..age = 1.5,
          'max': Pet()
            ..name = 'Whiskers'
            ..age = 1.5
        },
      ]);

      final result2 = pets.groupSelect(
        (age, pets) => {
          'key': age,
          'count': pets.length,
          'min': pets.min(ageComparer),
          'max': pets.max(ageComparer),
        },
        keySelector: (pet) => pet.age,
        keyComparer: EqualityComparer(
          comparer: (k1, k2) => k1.floor() == k2.floor(),
          hasher: (key) => key.floor().hashCode,
        ),
      );

      expect(result2, [
        {
          'key': 8.3,
          'count': 1,
          'min': Pet()
            ..name = 'Barley'
            ..age = 8.3,
          'max': Pet()
            ..name = 'Barley'
            ..age = 8.3
        },
        {
          'key': 4.9,
          'count': 2,
          'min': Pet()
            ..name = 'Daisy'
            ..age = 4.3,
          'max': Pet()
            ..name = 'Boots'
            ..age = 4.9
        },
        {
          'key': 1.5,
          'count': 1,
          'min': Pet()
            ..name = 'Whiskers'
            ..age = 1.5,
          'max': Pet()
            ..name = 'Whiskers'
            ..age = 1.5
        },
      ]);
    });

    test('groupSelectValue', () {
      final barley = Pet()
        ..name = 'Barley'
        ..age = 8.3;
      final boots = Pet()
        ..name = 'Boots'
        ..age = 4.9;
      final whiskers = Pet()
        ..name = 'Whiskers'
        ..age = 1.5;
      final daisy = Pet()
        ..name = 'Daisy'
        ..age = 4.3;

      final pets = [barley, boots, whiskers, daisy];

      final result = pets.groupSelectValue(
        (age, pets) => {
          'key': age,
          'names': pets,
          'count': pets.length,
        },
        keySelector: (pet) => pet.age.floor(),
        valueSelector: (pet) => pet.name,
      );

      expect(result, [
        {
          'key': 8,
          'names': ['Barley'],
          'count': 1
        },
        {
          'key': 4,
          'names': ['Boots', 'Daisy'],
          'count': 2
        },
        {
          'key': 1,
          'names': ['Whiskers'],
          'count': 1
        },
      ]);

      final result2 = pets.groupSelectValue(
        (age, pets) => {
          'key': age,
          'names': pets,
          'count': pets.length,
        },
        keySelector: (pet) => pet.age,
        valueSelector: (pet) => pet.name,
        keyComparer: EqualityComparer(
          comparer: (k1, k2) => k1.floor() == k2.floor(),
          hasher: (key) => key.floor().hashCode,
        ),
      );

      expect(result2, [
        {
          'key': 8.3,
          'names': ['Barley'],
          'count': 1
        },
        {
          'key': 4.9,
          'names': ['Boots', 'Daisy'],
          'count': 2
        },
        {
          'key': 1.5,
          'names': ['Whiskers'],
          'count': 1
        },
      ]);
    });

    test('intersect', () {
      var a = [0, 1, 2, 3];
      var b = [2, 3, 4, 5];

      var result = a.intersect(b);
      expect(result, orderedEquals([2, 3]));

      var result2 = b.intersect(a);
      expect(result2, orderedEquals([2, 3]));

      var result3 = a.intersect(a);
      expect(result3, orderedEquals([0, 1, 2, 3]));

      var c = ['a', 'b', 'c', 'd'];
      var d = ['C', 'D', 'E', 'F'];

      var result4 = c.intersect(d);
      expect(result4, orderedEquals([]));

      var result5 = c.intersect(d, (s) => s.toUpperCase());
      expect(result5, orderedEquals(['c', 'd']));

      var result6 = d.intersect(c, (s) => s.toUpperCase());
      expect(result6, orderedEquals(['C', 'D']));
    });

    test('joinMap', () {
      final a = {'1': 1, '2': 2, '3': 3, '4': 4};
      final b = {'1': 1.0, '2': 2.0, '3': 3.0, '5': 5.0};

      final output = a.entries.joinMap(b.entries, (x) => x.key, (y) => y.key,
          (x, y) => '${x.value}_${y.value}');
      expect(output, orderedEquals(['1_1.0', '2_2.0', '3_3.0']));
    });

    test('lastOrDefault', () {
      var test = [0, 1, 2, 3];
      var result = test.lastOrDefault();
      expect(result, 3);

      var test2 = [];
      var result2 = test2.lastOrDefault();
      expect(result2, null);

      var result3 = test2.lastOrDefault(4);
      expect(result3, 4);
    });

    test('lastWhereOrDefault', () {
      var test = [0, 1, 2, 3];
      var result = test.lastWhereOrDefault((i) => i.isOdd);
      expect(result, 3);

      var test2 = [0, 2, 4, 6];
      var result2 = test2.lastWhereOrDefault((i) => i.isOdd);
      expect(result2, null);

      var result3 = test2.lastWhereOrDefault((i) => i.isOdd, 5);
      expect(result3, 5);
    });

    test('max', () {
      var test = [0, 1, 2, 3];
      var result = test.max();
      expect(result, 3);

      var test2 = <int>[];
      var result2 = () => test2.max();
      expect(result2, throwsA(isA<StateError>()));

      var test3 = ['0', '1', '2', '3'];
      var result3 = test3.max((a, b) => int.parse(a).compareTo(int.parse(b)));
      expect(result3, '3');
    });

    test('min', () {
      var test = [0, 1, 2, 3];
      var result = test.min();
      expect(result, 0);

      var test2 = <int>[];
      var result2 = () => test2.min();
      expect(result2, throwsA(isA<StateError>()));

      var test3 = ['0', '1', '2', '3'];
      var result3 = test3.min((a, b) => int.parse(a).compareTo(int.parse(b)));
      expect(result3, '0');
    });

    test('ofType', () {
      var test = [0, 1.0, 2, 3.0];
      expect(test, isA<Iterable<num>>());

      var result = test.ofType<int>();
      expect(result, orderedEquals([0, 2]));
    });

    test('orderBy', () {
      final input = [4, 2, 5, 1, 3];
      final result = input.orderBy((i) => i);

      expect(result, orderedEquals([1, 2, 3, 4, 5]));
    });

    test('orderByDescending', () {
      final input = [4, 2, 5, 1, 3];
      final result = input.orderByDescending((i) => i);

      expect(result, orderedEquals([5, 4, 3, 2, 1]));
    });

    test('prepend', () {
      var list = [0, 1, 2, 3];
      var result = list.prepend(4);
      expect(result, orderedEquals([4, 0, 1, 2, 3]));
    });

    test('reverse', () {
      var test = [0, 1, 2, 3];
      var result = test.reverse();
      expect(result, orderedEquals([3, 2, 1, 0]));
    });

    test('select', () {
      final input = ['a', 'b', 'c', 'd', 'e'];
      final result = input.select((c, i) => c.codeUnits[0]);
      expect(result, orderedEquals([97, 98, 99, 100, 101]));

      final result2 = input.select((c, i) => '${i}_${c.codeUnits[0]}');
      expect(
          result2, orderedEquals(['0_97', '1_98', '2_99', '3_100', '4_101']));
    });

    test('selectMany', () {
      final input = [
        [0, 1, 2, 3, 4],
        [5, 6, 7, 8, 9],
        [10, 11, 12, 13, 14],
      ];

      final output = input.selectMany((x, i) => x);
      expect(output,
          orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]));

      final output2 = input.selectMany((x, i) => [i, ...x]);
      expect(
          output2,
          orderedEquals(
              [0, 0, 1, 2, 3, 4, 1, 5, 6, 7, 8, 9, 2, 10, 11, 12, 13, 14]));
    });

    test('sequenceEqual', () {
      final input = ['a', 'b', 'c', 'd', 'e'];
      final output = input.sequenceEqual(['a', 'b', 'c', 'd', 'e']);
      expect(output, isTrue);

      final output2 = input.sequenceEqual(['b', 'c', 'd', 'e', 'a']);
      expect(output2, isFalse);

      final output3 = input.sequenceEqual(['a', 'b', 'c', 'd']);
      expect(output3, isFalse);

      final output4 = input.sequenceEqual(['a', 'b', 'c', 'd', 'e', 'f']);
      expect(output4, isFalse);

      final output5 = input.sequenceEqual(['A', 'B', 'C', 'D', 'E']);
      expect(output5, isFalse);

      final output6 = input.sequenceEqual(
          ['A', 'B', 'C', 'D', 'E'], null, (s) => s.toLowerCase());
      expect(output6, isTrue);
    });

    test('singleOrDefault', () {
      final input = [0];
      final output = input.singleOrDefault();
      expect(output, equals(0));

      final input2 = [];
      final output2 = input2.singleOrDefault();
      expect(output2, isNull);

      final input3 = [];
      final output3 = input3.singleOrDefault(3);
      expect(output3, 3);

      final input4 = [0, 1];
      final output4 = () => input4.singleOrDefault();
      expect(output4, throwsA(isA<StateError>()));
    });

    test('singleWhereOrDefault', () {
      final input = [0, 1, 2, 3, 4];
      final output = input.singleWhereOrDefault((x) => x == 2);
      expect(output, equals(2));

      final input2 = [0, 1, 2, 3, 4];
      final output2 = input2.singleWhereOrDefault((x) => x == 5);
      expect(output2, isNull);

      final input3 = [];
      final output3 = input3.singleWhereOrDefault((x) => x == 5, 5);
      expect(output3, 5);

      final input4 = [2, 2];
      final output4 = () => input4.singleWhereOrDefault((x) => x == 2);
      expect(output4, throwsA(isA<StateError>()));
    });

    test('sum', () {
      final input = [1, 2, 3, 4, 5];
      final output = input.sum();
      expect(output, 15);
      expect(output, isA<int>());

      final input2 = [1.0, 2.0, 3.0, 4.0, 5.0];
      final output2 = input2.sum();
      expect(output2, 15);
      expect(output2, isA<double>());

      final input3 = ['1', '2', '3', '4', '5'];
      final output3 = input3.sum((x) => int.parse(x));
      expect(output3, 15);

      final input4 = [];
      final output4 = () => input4.sum();
      expect(output4, throwsA(isA<StateError>()));
    });

    test('thenBy', () {
      final barley = Pet()
        ..name = 'Barley'
        ..age = 8;
      final daisy = Pet()
        ..name = 'Daisy'
        ..age = 4;
      final whiskers = Pet()
        ..name = 'Whiskers'
        ..age = 1;
      final boots = Pet()
        ..name = 'Boots'
        ..age = 4;

      final pets = [barley, daisy, whiskers, boots];

      expect(
          pets,
          orderedEquals([
            barley,
            daisy,
            whiskers,
            boots,
          ]));

      final interim = pets.orderBy((p) => p.age);

      expect(
          interim,
          orderedEquals([
            whiskers,
            daisy,
            boots,
            barley,
          ]));

      final result = interim.thenBy((p) => p.name);

      expect(
          result,
          orderedEquals([
            whiskers,
            boots,
            daisy,
            barley,
          ]));

      final errorTest = () => [0, 1, 2].map((i) => i + 1).thenBy((i) => i);
      expect(errorTest, throwsA(isA<UnsupportedError>()));
    });

    test('thenByDescending', () {
      final barley = Pet()
        ..name = 'Barley'
        ..age = 8;
      final boots = Pet()
        ..name = 'Boots'
        ..age = 4;
      final daisy = Pet()
        ..name = 'Daisy'
        ..age = 4;
      final whiskers = Pet()
        ..name = 'Whiskers'
        ..age = 1;

      final pets = [barley, boots, daisy, whiskers];

      expect(
          pets,
          orderedEquals([
            barley,
            boots,
            daisy,
            whiskers,
          ]));

      final interim = pets.orderBy((p) => p.age);

      expect(
          interim,
          orderedEquals([
            whiskers,
            boots,
            daisy,
            barley,
          ]));

      final result = interim.thenByDescending((p) => p.name);

      expect(
          result,
          orderedEquals([
            whiskers,
            daisy,
            boots,
            barley,
          ]));

      final errorTest =
          () => [0, 1, 2].map((i) => i + 1).thenByDescending((i) => i);
      expect(errorTest, throwsA(isA<UnsupportedError>()));
    });

    test('toMap', () {
      final input = [1, 2, 3, 4, 5];
      expect(input, isA<List<int>>());

      final result = input.toMap((x) => MapEntry(x, x.toString()));
      expect(result, equals({1: '1', 2: '2', 3: '3', 4: '4', 5: '5'}));
    });

    test('union', () {
      var a = [0, 1, 2, 3];
      var b = [2, 3, 4, 5];

      var result = a.union(b);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5]));

      var result2 = b.union(a);
      expect(result2, orderedEquals([2, 3, 4, 5, 0, 1]));

      var result3 = a.union(a);
      expect(result3, orderedEquals([0, 1, 2, 3]));

      var c = ['a', 'b', 'c', 'd'];
      var d = ['C', 'D', 'E', 'F'];

      var result4 = c.union(d);
      expect(result4, orderedEquals(['a', 'b', 'c', 'd', 'C', 'D', 'E', 'F']));

      var result5 = c.union(d, (s) => s.toUpperCase());
      expect(result5, orderedEquals(['a', 'b', 'c', 'd', 'E', 'F']));

      var result6 = d.union(c, (s) => s.toUpperCase());
      expect(result6, orderedEquals(['C', 'D', 'E', 'F', 'a', 'b']));
    });

    test('zip', () {
      final a = [1, 2, 3, 4];
      final b = [5.0, 6.0, 7.0];

      final output = a.zip(b, (x, y) => '$x-$y');
      expect(output, orderedEquals(['1-5.0', '2-6.0', '3-7.0']));
    });
  });
}

class Person {
  String name;
}

class Pet {
  String name;
  double age;
  Person owner;

  bool operator ==(dynamic other) {
    if (other is Pet) {
      return name == other.name && age == other.age && owner == other.owner;
    }
    return false;
  }

  @override
  String toString() => '{name: $name, age: $age, owner: $owner}';
}
