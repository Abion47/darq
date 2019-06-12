import 'package:darq/darq.dart';
import 'package:darq/src/errors.dart';
import 'package:darq/src/enumerable.dart';
import 'package:darq/src/enumerables/value_enumerable.dart';
import 'package:test/test.dart';

void main() {
  test('Creating an enumerable', () {
    var list = [0, 1, 2, 3, 4];
    var e = E(list);

    expect(e, isA<Enumerable<int>>());
  });

  test('Aggregate', () {
    var list = [0, 1, 2, 3, 4];
    var result = E(list).Aggregate((a, b) => a + b);
    expect(result, equals(10));

    var list2 = ['a', 'b', 'c', 'd', 'e'];
    var result2 = E(list2).Aggregate((a, b) => a + b);
    expect(result2, equals('abcde'));

    var result3 = E(list2).Aggregate((a, b) => a + b, 'xyz');
    expect(result3, equals('xyzabcde'));

    var list4 = [2, 2, 2, 2, 2, 2, 2, 2];
    var result4 = E(list4).Aggregate((a, b) => a * b, 1);
    expect(result4, equals(256));
  });

  test('All', () {
    var list = [true, true, true, true];
    var result = E(list).All();
    expect(result, isTrue);

    var list2 = [true, true, true, false];
    var result2 = E(list2).All();
    expect(result2, isFalse);

    var list3 = [2, 4, 6, 8];
    var result3 = E(list3).All((x) => x.isEven);
    expect(result3, isTrue);

    var list4 = [2, 4, 6, 7];
    var result4 = E(list4).All((x) => x.isEven);
    expect(result4, isFalse);
  });

  test('Any', () {
    var list = [false, false, false, false];
    var result = E(list).Any();
    expect(result, isFalse);

    var list2 = [false, false, false, true];
    var result2 = E(list2).Any();
    expect(result2, isTrue);

    var list3 = [2, 4, 6, 8];
    var result3 = E(list3).Any((x) => x.isOdd);
    expect(result3, isFalse);

    var list4 = [2, 4, 6, 7];
    var result4 = E(list4).Any((x) => x.isOdd);
    expect(result4, isTrue);
  });

  test('Append', () {
    var list = [0, 1, 2, 3];
    var result = E(list).Append(4);
    expect(result, orderedEquals([0, 1, 2, 3, 4]));
  });

  test('Average', () {
    var list = [1, 3, 5, 7, 9];
    var result = E(list).Average();
    expect(result, equals(5));
    expect(result, isA<int>());
  });

  test('Cast', () {
    var list = <num>[0, 1, 2, 3, 4];

    var e = E(list);
    expect(e, isA<Enumerable<num>>());

    var result = E(list).Cast<int>();
    expect(result, orderedEquals([0, 1, 2, 3, 4]));
    expect(result, isA<Enumerable<int>>());

    var result2 = e.Cast((n) => n.toDouble());
    expect(result2, orderedEquals([0.0, 1.0, 2.0, 3.0, 4.0]));
    expect(result2, isA<Enumerable<double>>());
  });

  test('Concat', () {
    var list = [0, 1, 2, 3, 4];
    var result = E(list).Concat([5, 6, 7, 8]);
    expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8]));

    var result2 = E(list).Concat(E([5, 6, 7, 8]).Select((n) => n));
    expect(result2, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8]));
  });

  test('Contains', () {
    var list = [0, 1, 2, 3, 4];
    var result = E(list).Contains(2);
    expect(result, isTrue);

    var list2 = ['a', 'b', 'c', 'd', 'e'];
    var comparer = EqualityComparer<String>(
      comparer: (e, s) => e == s.toUpperCase(),
    );
    var result2 = E(list2).Contains('D', comparer: comparer);
    expect(result2, isTrue);

    var list3 = [0, 1, 2, 3, 4];
    var result3 = E(list3).Contains(5);
    expect(result3, isFalse);
  });

  test('Count', () {
    var list = [];
    var result = E(list).Count();
    expect(result, equals(0));

    var list2 = [0, 1, 2, 3, 4, 5];
    var result2 = E(list2).Count();
    expect(result2, equals(6));
  });

  test('DefaultIfEmpty', () {
    var list = <int>[];
    var result = E(list).DefaultIfEmpty(5);
    expect(result, orderedEquals([5]));

    var list2 = [0, 1, 2, 3, 4];
    var result2 = E(list2).DefaultIfEmpty(5);
    expect(result2, orderedEquals([0, 1, 2, 3, 4]));
  });

  test('Distinct', () {
    var list = <int>[0, 1, 2, 3, 4];
    var result = E(list).Distinct();
    expect(result, orderedEquals([0, 1, 2, 3, 4]));

    var list2 = [0, 1, 1, 2, 2, 2, 3, 4, 4, 4, 4, 4, 4];
    var result2 = E(list2).Distinct();
    expect(result2, orderedEquals([0, 1, 2, 3, 4]));

    var list3 = ['a', 'b', 'c', 'A', 'B', 'C'];
    var comparer = EqualityComparer<String>(
      comparer: (a, b) => a.toLowerCase() == b.toLowerCase(),
      hasher: (s) => s.toLowerCase().hashCode,
    );
    var result3 = E(list3).Distinct(comparer: comparer);
    expect(result3, orderedEquals(['a', 'b', 'c']));
  });

  test('ElementAt', () {
    var list = <int>[0, 1, 2, 3, 4];
    var result = E(list).ElementAt(3);
    expect(result, equals(3));

    var result2 = () => E(list).ElementAt(6);
    expect(result2, throwsA(isA<ElementNotFoundError>()));
  });

  test('ElementAtOrDefault', () {
    var list = <int>[0, 1, 2, 3, 4];

    var result = E(list).ElementAtOrDefault(3);
    expect(result, equals(3));

    var result2 = E(list).ElementAtOrDefault(6);
    expect(result2, isNull);

    var result3 = E(list).ElementAtOrDefault(6, defaultValue: 5);
    expect(result3, equals(5));
  });

  test('Empty', () {
    var empty = Enumerable.empty();
    expect(empty, orderedEquals([]));
  });

  test('Except', () {
    var a = [0, 1, 2, 3];
    var b = [2, 3, 4, 5];

    var result = E(a).Except(b);
    expect(result, orderedEquals([0, 1]));

    var result2 = E(b).Except(a);
    expect(result2, orderedEquals([4, 5]));

    var result3 = E(a).Except(a);
    expect(result3, orderedEquals([]));

    var c = ['a', 'b', 'c', 'D'];
    var d = ['C', 'd', 'E', 'F'];

    var comparer = EqualityComparer<String>(
      comparer: (a, b) => a.toLowerCase() == b.toLowerCase(),
      hasher: (s) => s.toLowerCase().hashCode,
    );
    var comparer2 = EqualityComparer<String>(
      comparer: (a, b) => a.toUpperCase() == b.toUpperCase(),
      hasher: (s) => s.toUpperCase().hashCode,
    );

    var result4 = E(c).Except(d, comparer: comparer);
    expect(result4, orderedEquals(['a', 'b']));

    var result5 = E(d).Except(c, comparer: comparer2);
    expect(result5, orderedEquals(['E', 'F']));

    var result6 = E(c).Except(c, comparer: comparer);
    expect(result6, orderedEquals([]));
  });

  test('First', () {
    var test = [0, 1, 2, 3];
    var result = E(test).First();
    expect(result, 0);

    var test2 = [];
    var result2 = () => E(test2).First();
    expect(result2, throwsA(isA<EmptyEnumerableError>()));
  });

  test('FirstOrDefault', () {
    var test = [0, 1, 2, 3];
    var result = E(test).FirstOrDefault();
    expect(result, 0);

    var test2 = [];
    var result2 = E(test2).FirstOrDefault();
    expect(result2, null);

    var result3 = E(test2).FirstOrDefault(defaultValue: 4);
    expect(result3, 4);
  });

  test('GroupBy', () {
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

    final results = E(pets).GroupBy(
      (pet) => pet.age,
    );

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

    final resultList = results.ToList();
    expect(resultList[0].key, 8);
    expect(resultList[1].key, 4);
    expect(resultList[2].key, 1);
  });

  test('GroupByValue', () {
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

    final results = E(pets).GroupByValue(
      (pet) => pet.age,
      (pet) => pet.name,
    );

    expect(results, [
      ['Barley'],
      ['Boots', 'Daisy'],
      ['Whiskers'],
    ]);

    final resultList = results.ToList();
    expect(resultList[0].key, 8);
    expect(resultList[1].key, 4);
    expect(resultList[2].key, 1);
  });

  test('GroupJoin', () {
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

    final result = E(people).GroupJoin(
      pets,
      (person) => person.name,
      (pet) => pet.owner.name,
      (person, pets) => {
            'ownerName': person.name,
            'pets': E(pets).Select((pet) => pet.name).ToList()
          },
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

    final result2 = E(people).GroupJoin(
      pets,
      (person) => person.name,
      (pet) => pet.owner.name,
      (person, pets) => {
            'ownerName': person.name,
            'pets': E(pets).Select((pet) => pet.name).ToList()
          },
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

  test('GroupSelect', () {
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

    final ageComparer = EqualityComparer<Pet>(
      sorter: (p1, p2) => p1.age.compareTo(p2.age),
    );

    final result = E(pets).GroupSelect(
      (pet) => pet.age.floor(),
      (age, pets) => {
            'key': age,
            'count': E(pets).Count(),
            'min': E(pets).Min(ageComparer),
            'max': E(pets).Max(ageComparer),
          },
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

    final result2 = E(pets).GroupSelect(
      (pet) => pet.age,
      (age, pets) => {
            'key': age,
            'count': E(pets).Count(),
            'min': E(pets).Min(ageComparer),
            'max': E(pets).Max(ageComparer),
          },
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

  test('GroupSelectValue', () {
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

    final result = E(pets).GroupSelectValue(
      (pet) => pet.age.floor(),
      (pet) => pet.name,
      (age, pets) => {
            'key': age,
            'names': pets,
            'count': E(pets).Count(),
          },
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

    final result2 = E(pets).GroupSelectValue(
      (pet) => pet.age,
      (pet) => pet.name,
      (age, pets) => {
            'key': age,
            'names': pets,
            'count': E(pets).Count(),
          },
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

  test('Intersect', () {
    var a = [0, 1, 2, 3];
    var b = [5, 4, 3, 2];

    var result = E(a).Intersect(b);
    expect(result.ToList(), orderedEquals([2, 3]));

    var result2 = E(b).Intersect(a);
    expect(result2.ToList(), orderedEquals([3, 2]));

    var result3 = E(a).Intersect(a);
    expect(result3.ToList(), orderedEquals([0, 1, 2, 3]));

    var c = ['a', 'b', 'c', 'D'];
    var d = ['C', 'd', 'E', 'F'];

    var comparer = EqualityComparer<String>(
      comparer: (a, b) => a.toLowerCase() == b.toLowerCase(),
      hasher: (s) => s.toLowerCase().hashCode,
    );
    var comparer2 = EqualityComparer<String>(
      comparer: (a, b) => a.toUpperCase() == b.toUpperCase(),
      hasher: (s) => s.toUpperCase().hashCode,
    );

    var result4 = E(c).Intersect(d, comparer: comparer);
    expect(result4, orderedEquals(['c', 'D']));

    var result5 = E(d).Intersect(c, comparer: comparer2);
    expect(result5, orderedEquals(['C', 'd']));

    var result6 = E(c).Intersect(c, comparer: comparer);
    expect(result6, orderedEquals(['a', 'b', 'c', 'D']));
  });

  test('Join', () {
    final a = {'1': 1, '2': 2, '3': 3, '4': 4};
    final b = {'1': 1.0, '2': 2.0, '3': 3.0, '5': 5.0};

    final output = E(a.entries).Join(b.entries, (x) => x.key, (y) => y.key,
        (x, y) => '${x.value}_${y.value}');
    expect(output, orderedEquals(['1_1.0', '2_2.0', '3_3.0']));
  });

  test('Last', () {
    var test = [0, 1, 2, 3];
    var result = E(test).Last();
    expect(result, 3);

    var test2 = [];
    var result2 = () => E(test2).Last();
    expect(result2, throwsA(isA<EmptyEnumerableError>()));
  });

  test('LastOrDefault', () {
    var test = [0, 1, 2, 3];
    var result = E(test).LastOrDefault();
    expect(result, 3);

    var test2 = [];
    var result2 = E(test2).LastOrDefault();
    expect(result2, null);

    var result3 = E(test2).LastOrDefault(defaultValue: 4);
    expect(result3, 4);
  });

  test('Max', () {
    var test = [0, 1, 2, 3];
    var result = E(test).Max();
    expect(result, 3);

    var test2 = <int>[];
    var result2 = () => E(test2).Max();
    expect(result2, throwsA(isA<EmptyEnumerableError>()));

    var test3 = ['0', '1', '2', '3'];
    var comparer = EqualityComparer<String>(
        sorter: (a, b) => int.parse(a).compareTo(int.parse(b)));
    var result3 = E(test3).Max(comparer);
    expect(result3, '3');
  });

  test('Min', () {
    var test = [0, 1, 2, 3];
    var result = E(test).Min();
    expect(result, 0);

    var test2 = <int>[];
    var result2 = () => E(test2).Min();
    expect(result2, throwsA(isA<EmptyEnumerableError>()));

    var test3 = ['0', '1', '2', '3'];
    var comparer = EqualityComparer<String>(
        sorter: (a, b) => int.parse(a).compareTo(int.parse(b)));
    var result3 = E(test3).Min(comparer);
    expect(result3, '0');
  });

  test('OfType', () {
    var test = [0, 1.0, 2, 3.0];
    var e = E(test);
    expect(e, isA<ValueEnumerable<num>>());

    var result = e.OfType<int>();
    expect(result, orderedEquals([0, 2]));
  });

  test('OrderBy', () {
    final input = [4, 2, 5, 1, 3];
    final result = E(input).OrderBy((i) => i);

    expect(result, orderedEquals([1, 2, 3, 4, 5]));
  });

  test('OrderByDescending', () {
    final input = [4, 2, 5, 1, 3];
    final result = E(input).OrderByDescending((i) => i);

    expect(result, orderedEquals([5, 4, 3, 2, 1]));
  });

  test('Prepend', () {
    var list = [0, 1, 2, 3];
    var result = E(list).Prepend(4);
    expect(result, orderedEquals([4, 0, 1, 2, 3]));
  });

  test('Range', () {
    var list = Enumerable.range(4, 5);
    expect(list, orderedEquals([4, 5, 6, 7, 8]));
  });

  test('Repeat', () {
    var list = Enumerable.repeat('a', 3);
    expect(list, orderedEquals(['a', 'a', 'a']));
  });

  test('Reverse', () {
    var test = [0, 1, 2, 3];
    var result = E(test).Reverse();
    expect(result, orderedEquals([3, 2, 1, 0]));
  });

  test('Select', () {
    final input = ['a', 'b', 'c', 'd', 'e'];
    final output = E(input).Select((c) => c.codeUnits[0]);
    expect(output, orderedEquals([97, 98, 99, 100, 101]));
  });

  test('SelectMany', () {
    final input = [
      [0, 1, 2, 3, 4],
      [5, 6, 7, 8, 9],
      [10, 11, 12, 13, 14],
    ];
    final output = E(input).SelectMany((x) => x).ToList();
    expect(output,
        orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]));
  });

  test('SequenceEqual', () {
    final input = ['a', 'b', 'c', 'd', 'e'];
    final output = E(input).SequenceEqual(['a', 'b', 'c', 'd', 'e']);
    expect(output, isTrue);

    final output2 = E(input).SequenceEqual(['b', 'c', 'd', 'e', 'a']);
    expect(output2, isFalse);

    final output3 = E(input).SequenceEqual(['a', 'b', 'c', 'd']);
    expect(output3, isFalse);

    final output4 = E(input).SequenceEqual(['a', 'b', 'c', 'd', 'e', 'f']);
    expect(output4, isFalse);
  });

  test('Single', () {
    final input = [0];
    final output = E(input).Single();
    expect(output, equals(0));

    final input2 = [0, 1];
    final output2 = () => E(input2).Single();
    expect(output2, throwsA(isA<OperationError>()));

    final input3 = [0, 1, 2, 3, 4];
    final output3 = E(input3).Single((x) => x == 2);
    expect(output3, equals(2));

    final input4 = [0, 1, 2, 3, 4, 2];
    final output4 = () => E(input4).Single((x) => x == 2);
    expect(output4, throwsA(isA<OperationError>()));

    final input5 = [];
    final output5 = () => E(input5).Single();
    expect(output5, throwsA(isA<OperationError>()));

    final input6 = [];
    final output6 = () => E(input6).Single((x) => x == 2);
    expect(output6, throwsA(isA<OperationError>()));
  });

  test('SingleOrDefault', () {
    final input = [0];
    final output = E(input).SingleOrDefault(5);
    expect(output, equals(0));

    final input2 = [0, 1];
    final output2 = () => E(input2).SingleOrDefault(5);
    expect(output2, throwsA(isA<OperationError>()));

    final input3 = [0, 1, 2, 3, 4];
    final output3 = E(input3).SingleOrDefault(5, (x) => x == 2);
    expect(output3, equals(2));

    final input4 = [0, 1, 2, 3, 4, 2];
    final output4 = () => E(input4).SingleOrDefault(5, (x) => x == 2);
    expect(output4, throwsA(isA<OperationError>()));

    final input5 = [];
    final output5 = E(input5).SingleOrDefault(5);
    expect(output5, 5);

    final input6 = [];
    final output6 = E(input6).SingleOrDefault(5, (x) => x == 2);
    expect(output6, 5);
  });

  test('Skip', () {
    final input = [0, 1, 2, 3, 4, 5];
    final output = E(input).Skip(3);
    expect(output, orderedEquals([3, 4, 5]));
  });

  test('SkipWhile', () {
    final input = [0, 1, 2, 3, 4, 5];
    final output = E(input).SkipWhile((x) => x < 3);
    expect(output, orderedEquals([3, 4, 5]));
  });

  test('Sum', () {
    final input = [1, 2, 3, 4, 5];
    final output = E(input).Sum();
    expect(output, 15);

    final input2 = ['1', '2', '3', '4', '5'];
    final output2 = E(input2).Sum((x) => int.parse(x));
    expect(output2, 15);
  });

  test('Take', () {
    final input = [0, 1, 2, 3, 4, 5];
    final output = E(input).Take(3);
    expect(output, orderedEquals([0, 1, 2]));
  });

  test('TakeWhile', () {
    final input = [0, 1, 2, 3, 4, 5];
    final output = E(input).TakeWhile((x) => x < 3);
    expect(output, orderedEquals([0, 1, 2]));
  });

  test('ThenBy', () {
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

    final interim = E(pets).OrderBy((p) => p.age);

    expect(
        interim,
        orderedEquals([
          whiskers,
          daisy,
          boots,
          barley,
        ]));

    final result = interim.ThenBy((p) => p.name);

    expect(
        result,
        orderedEquals([
          whiskers,
          boots,
          daisy,
          barley,
        ]));

    final errorTest = () => E([0, 1, 2]).Select((i) => i + 1).ThenBy((i) => i);
    expect(errorTest, throwsA(isA<OperationError>()));
  });

  test('ThenByDescending', () {
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

    final interim = E(pets).OrderBy((p) => p.age);

    expect(
        interim,
        orderedEquals([
          whiskers,
          boots,
          daisy,
          barley,
        ]));

    final result = interim.ThenByDescending((p) => p.name);

    expect(
        result,
        orderedEquals([
          whiskers,
          daisy,
          boots,
          barley,
        ]));

    final errorTest =
        () => E([0, 1, 2]).Select((i) => i + 1).ThenByDescending((i) => i);
    expect(errorTest, throwsA(isA<OperationError>()));
  });

  test('ToList', () {
    final input = [1, 2, 3, 4, 5];
    expect(input, isA<List<int>>());

    final e = E(input);
    expect(e, isA<ValueEnumerable<int>>());

    final result = e.ToList();
    expect(result, isA<List<int>>());
    expect(result, orderedEquals([1, 2, 3, 4, 5]));
  });

  test('ToMap', () {
    final input = [1, 2, 3, 4, 5];
    expect(input, isA<List<int>>());

    final result = E(input).ToMap((x) => x, (x) => x.toString());
    expect(result, equals({1: '1', 2: '2', 3: '3', 4: '4', 5: '5'}));
  });

  test('ToSet', () {
    final input = [1, 2, 3, 2, 3];
    expect(input, isA<List<int>>());

    final result = E(input).ToSet();
    expect(result, isA<Set<int>>());
    expect(result, equals(Set.of([1, 2, 3])));
  });

  test('Union', () {
    var a = [0, 1, 2, 3];
    var b = [2, 3, 4, 5];

    var result = E(a).Union(b);
    expect(result, orderedEquals([0, 1, 2, 3, 4, 5]));

    var result2 = E(b).Union(a);
    expect(result2, orderedEquals([2, 3, 4, 5, 0, 1]));

    var result3 = E(a).Union(a);
    expect(result3, orderedEquals([0, 1, 2, 3]));

    var c = ['a', 'b', 'c', 'D'];
    var d = ['C', 'd', 'E', 'F'];

    var result4 = E(c).Union(d);
    expect(result4, orderedEquals(['a', 'b', 'c', 'D', 'C', 'd', 'E', 'F']));

    var comparer = EqualityComparer<String>(
      comparer: (a, b) => a.toLowerCase() == b.toLowerCase(),
      hasher: (s) => s.toLowerCase().hashCode,
    );
    var comparer2 = EqualityComparer<String>(
      comparer: (a, b) => a.toUpperCase() == b.toUpperCase(),
      hasher: (s) => s.toUpperCase().hashCode,
    );

    var result5 = E(c).Union(d, comparer: comparer);
    expect(result5, orderedEquals(['a', 'b', 'c', 'D', 'E', 'F']));

    var result6 = E(d).Union(c, comparer: comparer2);
    expect(result6, orderedEquals(['C', 'd', 'E', 'F', 'a', 'b']));

    var result7 = E(c).Union(c, comparer: comparer);
    expect(result7, orderedEquals(['a', 'b', 'c', 'D']));
  });

  test('Where', () {
    final input = [0, 1, 2, 3, 4, 5];
    final output = E(input).Where((x) => x.isEven);
    expect(output, orderedEquals([0, 2, 4]));
  });

  test('Zip', () {
    final a = [1, 2, 3, 4];
    final b = [5.0, 6.0, 7.0];

    final output = E(a).Zip(b, (x, y) => '$x-$y');
    expect(output, orderedEquals(['1-5.0', '2-6.0', '3-7.0']));
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
