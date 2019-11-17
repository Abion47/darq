// import 'dart:collection';

// import 'package:darq/darq.dart';
// import 'package:darq/src/errors.dart';
// import 'package:darq/src/enumerable.dart';
// import 'package:darq/src/enumerables/value_enumerable.dart';
// import 'package:test/test.dart';

// void main() {
//   test('Creating an enumerable', () {
//     var list = [0, 1, 2, 3, 4];
//     var e = E(list);

//     expect(e, isA<ListEnumerable<int>>());
//     expect(e, orderedEquals([0, 1, 2, 3, 4]));

//     var queue = Queue<int>.from([5, 4, 3, 2, 1]);
//     var e2 = E(queue);

//     expect(e2, isA<DefaultValueEnumerable<int>>());
//     expect(e2, orderedEquals([5, 4, 3, 2, 1]));
//   });

//   test('Creating an empty enumerable', () {
//     var e = Enumerable<int>.empty();

//     expect(e, isA<Enumerable<int>>());
//     expect(e, equals([]));
//   });

//   test('Creating a range enumerable', () {
//     var e = Enumerable.range(2, 5);

//     expect(e, isA<Enumerable<int>>());
//     expect(e, equals([2, 3, 4, 5, 6]));
//   });

//   test('Creating a repeat enumerable', () {
//     var object = Object();
//     var e = Enumerable.repeat(object, 3);

//     expect(e, isA<Enumerable<Object>>());
//     expect(e, orderedEquals([object, object, object]));
//   });

//   test('Creating a string enumerable', () {
//     var string = 'abcdef';
//     var e = Enumerable.fromString(string);

//     expect(e, isA<Enumerable<String>>());
//     expect(e, orderedEquals(['a', 'b', 'c', 'd', 'e', 'f']));
//   });

//   test('Creating a generated enumerable', () {
//     var e = Enumerable.generate(5, (i) => (i * 2).toString());

//     expect(e, isA<Enumerable<String>>());
//     expect(e, orderedEquals(['0', '2', '4', '6', '8']));
//   });

//   test('Aggregate', () {
//     var list = [0, 1, 2, 3, 4];
//     var result = E(list).aggregateE((a, b) => a + b);
//     expect(result, equals(10));

//     var list2 = ['a', 'b', 'c', 'd', 'e'];
//     var result2 = E(list2).aggregateE((a, b) => a + b);
//     expect(result2, equals('abcde'));

//     var result3 = E(list2).aggregateE((a, b) => a + b, 'xyz');
//     expect(result3, equals('xyzabcde'));

//     var list4 = [2, 2, 2, 2, 2, 2, 2, 2];
//     var result4 = E(list4).aggregateE((a, b) => a * b, 1);
//     expect(result4, equals(256));
//   });

//   test('All', () {
//     var list = [true, true, true, true];
//     var result = E(list).allE();
//     expect(result, isTrue);

//     var list2 = [true, true, true, false];
//     var result2 = E(list2).allE();
//     expect(result2, isFalse);

//     var list3 = [2, 4, 6, 8];
//     var result3 = E(list3).allE((x) => x.isEven);
//     expect(result3, isTrue);

//     var list4 = [2, 4, 6, 7];
//     var result4 = E(list4).allE((x) => x.isEven);
//     expect(result4, isFalse);
//   });

//   test('Any', () {
//     var list = [false, false, false, false];
//     var result = E(list).anyE();
//     expect(result, isFalse);

//     var list2 = [false, false, false, true];
//     var result2 = E(list2).anyE();
//     expect(result2, isTrue);

//     var list3 = [2, 4, 6, 8];
//     var result3 = E(list3).anyE((x) => x.isOdd);
//     expect(result3, isFalse);

//     var list4 = [2, 4, 6, 7];
//     var result4 = E(list4).anyE((x) => x.isOdd);
//     expect(result4, isTrue);
//   });

//   test('Append', () {
//     var list = [0, 1, 2, 3];
//     var result = E(list).appendE(4);
//     expect(result, orderedEquals([0, 1, 2, 3, 4]));
//   });

//   test('Average', () {
//     var list = [1, 3, 5, 7, 9];
//     var result = E(list).averageE();
//     expect(result, equals(5));
//     expect(result, isA<int>());
//   });

//   test('Cast', () {
//     var list = <num>[0, 1, 2, 3, 4];

//     var e = E(list);
//     expect(e, isA<Enumerable<num>>());

//     var result = E(list).castE<int>();
//     expect(result, orderedEquals([0, 1, 2, 3, 4]));
//     expect(result, isA<Enumerable<int>>());

//     var result2 = e.castE((n) => n.toDouble());
//     expect(result2, orderedEquals([0.0, 1.0, 2.0, 3.0, 4.0]));
//     expect(result2, isA<Enumerable<double>>());
//   });

//   test('Concat', () {
//     var list = [0, 1, 2, 3, 4];
//     var result = E(list).concatE([5, 6, 7, 8]);
//     expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8]));

//     var result2 = E(list).concatE(E([5, 6, 7, 8]).selectE((n) => n));
//     expect(result2, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8]));
//   });

//   test('Contains', () {
//     var list = [0, 1, 2, 3, 4];
//     var result = E(list).containsE(2);
//     expect(result, isTrue);

//     var list2 = ['a', 'b', 'c', 'd', 'e'];
//     var comparer = EqualityComparer<String>(
//       comparer: (e, s) => e == s.toUpperCase(),
//     );
//     var result2 = E(list2).containsE('D', comparer: comparer);
//     expect(result2, isTrue);

//     var list3 = [0, 1, 2, 3, 4];
//     var result3 = E(list3).containsE(5);
//     expect(result3, isFalse);
//   });

//   test('Count', () {
//     var list = [];
//     var result = E(list).countE();
//     expect(result, equals(0));

//     var list2 = [0, 1, 2, 3, 4, 5];
//     var result2 = E(list2).countE();
//     expect(result2, equals(6));

//     var list3 = [0, 1, 2, 3, 4, 5];
//     var result3 = E(list3).countE((i) => i.isEven);
//     expect(result3, equals(3));
//   });

//   test('DefaultIfEmpty', () {
//     var list = <int>[];
//     var result = E(list).defaultIfEmptyE(5);
//     expect(result, orderedEquals([5]));

//     var list2 = [0, 1, 2, 3, 4];
//     var result2 = E(list2).defaultIfEmptyE(5);
//     expect(result2, orderedEquals([0, 1, 2, 3, 4]));
//   });

//   test('Distinct', () {
//     var list = <int>[0, 1, 2, 3, 4];
//     var result = E(list).distinctE();
//     expect(result, orderedEquals([0, 1, 2, 3, 4]));

//     var list2 = [0, 1, 1, 2, 2, 2, 3, 4, 4, 4, 4, 4, 4];
//     var result2 = E(list2).distinctE();
//     expect(result2, orderedEquals([0, 1, 2, 3, 4]));

//     var list3 = ['a', 'b', 'c', 'A', 'B', 'C'];
//     var comparer = EqualityComparer<String>(
//       comparer: (a, b) => a.toLowerCase() == b.toLowerCase(),
//       hasher: (s) => s.toLowerCase().hashCode,
//     );
//     var result3 = E(list3).distinctE(comparer: comparer);
//     expect(result3, orderedEquals(['a', 'b', 'c']));
//   });

//   test('ElementAt', () {
//     var list = <int>[0, 1, 2, 3, 4];
//     var result = E(list).elementAtE(3);
//     expect(result, equals(3));

//     var result2 = () => E(list).elementAtE(6);
//     expect(result2, throwsA(isA<EnumerableError>()));
//   });

//   test('ElementAtOrDefault', () {
//     var list = <int>[0, 1, 2, 3, 4];

//     var result = E(list).elementAtOrDefaultE(3);
//     expect(result, equals(3));

//     var result2 = E(list).elementAtOrDefaultE(6);
//     expect(result2, isNull);

//     var result3 = E(list).elementAtOrDefaultE(6, defaultValue: 5);
//     expect(result3, equals(5));
//   });

//   test('Empty', () {
//     var empty = Enumerable.empty();
//     expect(empty, orderedEquals([]));
//   });

//   test('Except', () {
//     var a = [0, 1, 2, 3];
//     var b = [2, 3, 4, 5];

//     var result = E(a).exceptE(b);
//     expect(result, orderedEquals([0, 1]));

//     var result2 = E(b).exceptE(a);
//     expect(result2, orderedEquals([4, 5]));

//     var result3 = E(a).exceptE(a);
//     expect(result3, orderedEquals([]));

//     var c = ['a', 'b', 'c', 'D'];
//     var d = ['C', 'd', 'E', 'F'];

//     var comparer = EqualityComparer<String>(
//       comparer: (a, b) => a.toLowerCase() == b.toLowerCase(),
//       hasher: (s) => s.toLowerCase().hashCode,
//     );
//     var comparer2 = EqualityComparer<String>(
//       comparer: (a, b) => a.toUpperCase() == b.toUpperCase(),
//       hasher: (s) => s.toUpperCase().hashCode,
//     );

//     var result4 = E(c).exceptE(d, comparer: comparer);
//     expect(result4, orderedEquals(['a', 'b']));

//     var result5 = E(d).exceptE(c, comparer: comparer2);
//     expect(result5, orderedEquals(['E', 'F']));

//     var result6 = E(c).exceptE(c, comparer: comparer);
//     expect(result6, orderedEquals([]));
//   });

//   test('First', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).firstE();
//     expect(result, 0);

//     var test2 = [];
//     var result2 = () => E(test2).firstE();
//     expect(result2, throwsA(isA<EnumerableError>()));

//     var test3 = [0, 1, 2, 3];
//     var result3 = E(test3).firstE(condition: (i) => i.isOdd);
//     expect(result3, 1);
//   });

//   test('FirstOrDefault', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).firstOrDefaultE();
//     expect(result, 0);

//     var test2 = [];
//     var result2 = E(test2).firstOrDefaultE();
//     expect(result2, null);

//     var result3 = E(test2).firstOrDefaultE(defaultValue: 4);
//     expect(result3, 4);

//     var test4 = [0, 1, 2, 3];
//     var result4 = E(test4).firstOrDefaultE(condition: (i) => i.isOdd);
//     expect(result4, 1);
//   });

//   test('GroupBy', () {
//     final barley = Pet()
//       ..name = 'Barley'
//       ..age = 8;
//     final boots = Pet()
//       ..name = 'Boots'
//       ..age = 4;
//     final whiskers = Pet()
//       ..name = 'Whiskers'
//       ..age = 1;
//     final daisy = Pet()
//       ..name = 'Daisy'
//       ..age = 4;

//     final pets = [barley, boots, whiskers, daisy];

//     final results = E(pets).groupByE(
//       (pet) => pet.age,
//     );

//     expect(results, [
//       [
//         Pet()
//           ..name = 'Barley'
//           ..age = 8
//       ],
//       [
//         Pet()
//           ..name = 'Boots'
//           ..age = 4,
//         Pet()
//           ..name = 'Daisy'
//           ..age = 4
//       ],
//       [
//         Pet()
//           ..name = 'Whiskers'
//           ..age = 1
//       ],
//     ]);

//     final resultList = results.toListE();
//     expect(resultList[0].key, 8);
//     expect(resultList[1].key, 4);
//     expect(resultList[2].key, 1);
//   });

//   test('GroupByValue', () {
//     final barley = Pet()
//       ..name = 'Barley'
//       ..age = 8;
//     final boots = Pet()
//       ..name = 'Boots'
//       ..age = 4;
//     final whiskers = Pet()
//       ..name = 'Whiskers'
//       ..age = 1;
//     final daisy = Pet()
//       ..name = 'Daisy'
//       ..age = 4;

//     final pets = [barley, boots, whiskers, daisy];

//     final results = E(pets).groupByValueE(
//       (pet) => pet.age,
//       (pet) => pet.name,
//     );

//     expect(results, [
//       ['Barley'],
//       ['Boots', 'Daisy'],
//       ['Whiskers'],
//     ]);

//     final resultList = results.toListE();
//     expect(resultList[0].key, 8);
//     expect(resultList[1].key, 4);
//     expect(resultList[2].key, 1);
//   });

//   test('GroupJoin', () {
//     final travis = Person()..name = 'Travis';
//     final terry = Person()..name = 'Terry';
//     final charlotte = Person()..name = 'Charlotte';
//     final benny = Person()..name = 'Benny';

//     final people = [travis, terry, charlotte, benny];

//     final barley = Pet()
//       ..name = 'Barley'
//       ..owner = terry;
//     final boots = Pet()
//       ..name = 'Boots'
//       ..owner = terry;
//     final whiskers = Pet()
//       ..name = 'Whiskers'
//       ..owner = charlotte;
//     final daisy = Pet()
//       ..name = 'Daisy'
//       ..owner = travis;

//     final pets = [barley, boots, whiskers, daisy];

//     final result = E(people).groupJoinE(
//       pets,
//       (person) => person.name,
//       (pet) => pet.owner.name,
//       (person, pets) => {
//             'ownerName': person.name,
//             'pets': E(pets).selectE((pet) => pet.name).toListE()
//           },
//     );

//     expect(result, [
//       {
//         'ownerName': 'Travis',
//         'pets': ['Daisy']
//       },
//       {
//         'ownerName': 'Terry',
//         'pets': ['Barley', 'Boots']
//       },
//       {
//         'ownerName': 'Charlotte',
//         'pets': ['Whiskers']
//       },
//       {'ownerName': 'Benny', 'pets': []},
//     ]);

//     final result2 = E(people).groupJoinE(
//       pets,
//       (person) => person.name,
//       (pet) => pet.owner.name,
//       (person, pets) => {
//             'ownerName': person.name,
//             'pets': E(pets).selectE((pet) => pet.name).toListE()
//           },
//       keyComparer: EqualityComparer(
//         comparer: (k1, k2) => k1.substring(0, 1) == k2.substring(0, 1),
//         hasher: (key) => key.substring(0, 1).hashCode,
//       ),
//     );

//     expect(result2, [
//       {
//         'ownerName': 'Travis',
//         'pets': ['Barley', 'Boots', 'Daisy']
//       },
//       {
//         'ownerName': 'Terry',
//         'pets': ['Barley', 'Boots', 'Daisy']
//       },
//       {
//         'ownerName': 'Charlotte',
//         'pets': ['Whiskers']
//       },
//       {'ownerName': 'Benny', 'pets': []},
//     ]);
//   });

//   test('GroupSelect', () {
//     final barley = Pet()
//       ..name = 'Barley'
//       ..age = 8.3;
//     final boots = Pet()
//       ..name = 'Boots'
//       ..age = 4.9;
//     final whiskers = Pet()
//       ..name = 'Whiskers'
//       ..age = 1.5;
//     final daisy = Pet()
//       ..name = 'Daisy'
//       ..age = 4.3;

//     final pets = [barley, boots, whiskers, daisy];

//     final ageComparer = EqualityComparer<Pet>(
//       sorter: (p1, p2) => p1.age.compareTo(p2.age),
//     );

//     final result = E(pets).groupSelectE(
//       (pet) => pet.age.floor(),
//       (age, pets) => {
//             'key': age,
//             'count': E(pets).countE(),
//             'min': E(pets).minE(ageComparer),
//             'max': E(pets).maxE(ageComparer),
//           },
//     );

//     expect(result, [
//       {
//         'key': 8,
//         'count': 1,
//         'min': Pet()
//           ..name = 'Barley'
//           ..age = 8.3,
//         'max': Pet()
//           ..name = 'Barley'
//           ..age = 8.3
//       },
//       {
//         'key': 4,
//         'count': 2,
//         'min': Pet()
//           ..name = 'Daisy'
//           ..age = 4.3,
//         'max': Pet()
//           ..name = 'Boots'
//           ..age = 4.9
//       },
//       {
//         'key': 1,
//         'count': 1,
//         'min': Pet()
//           ..name = 'Whiskers'
//           ..age = 1.5,
//         'max': Pet()
//           ..name = 'Whiskers'
//           ..age = 1.5
//       },
//     ]);

//     final result2 = E(pets).groupSelectE(
//       (pet) => pet.age,
//       (age, pets) => {
//             'key': age,
//             'count': E(pets).countE(),
//             'min': E(pets).minE(ageComparer),
//             'max': E(pets).maxE(ageComparer),
//           },
//       keyComparer: EqualityComparer(
//         comparer: (k1, k2) => k1.floor() == k2.floor(),
//         hasher: (key) => key.floor().hashCode,
//       ),
//     );

//     expect(result2, [
//       {
//         'key': 8.3,
//         'count': 1,
//         'min': Pet()
//           ..name = 'Barley'
//           ..age = 8.3,
//         'max': Pet()
//           ..name = 'Barley'
//           ..age = 8.3
//       },
//       {
//         'key': 4.9,
//         'count': 2,
//         'min': Pet()
//           ..name = 'Daisy'
//           ..age = 4.3,
//         'max': Pet()
//           ..name = 'Boots'
//           ..age = 4.9
//       },
//       {
//         'key': 1.5,
//         'count': 1,
//         'min': Pet()
//           ..name = 'Whiskers'
//           ..age = 1.5,
//         'max': Pet()
//           ..name = 'Whiskers'
//           ..age = 1.5
//       },
//     ]);
//   });

//   test('GroupSelectValue', () {
//     final barley = Pet()
//       ..name = 'Barley'
//       ..age = 8.3;
//     final boots = Pet()
//       ..name = 'Boots'
//       ..age = 4.9;
//     final whiskers = Pet()
//       ..name = 'Whiskers'
//       ..age = 1.5;
//     final daisy = Pet()
//       ..name = 'Daisy'
//       ..age = 4.3;

//     final pets = [barley, boots, whiskers, daisy];

//     final result = E(pets).groupSelectValueE(
//       (pet) => pet.age.floor(),
//       (pet) => pet.name,
//       (age, pets) => {
//             'key': age,
//             'names': pets,
//             'count': E(pets).countE(),
//           },
//     );

//     expect(result, [
//       {
//         'key': 8,
//         'names': ['Barley'],
//         'count': 1
//       },
//       {
//         'key': 4,
//         'names': ['Boots', 'Daisy'],
//         'count': 2
//       },
//       {
//         'key': 1,
//         'names': ['Whiskers'],
//         'count': 1
//       },
//     ]);

//     final result2 = E(pets).groupSelectValueE(
//       (pet) => pet.age,
//       (pet) => pet.name,
//       (age, pets) => {
//             'key': age,
//             'names': pets,
//             'count': E(pets).countE(),
//           },
//       keyComparer: EqualityComparer(
//         comparer: (k1, k2) => k1.floor() == k2.floor(),
//         hasher: (key) => key.floor().hashCode,
//       ),
//     );

//     expect(result2, [
//       {
//         'key': 8.3,
//         'names': ['Barley'],
//         'count': 1
//       },
//       {
//         'key': 4.9,
//         'names': ['Boots', 'Daisy'],
//         'count': 2
//       },
//       {
//         'key': 1.5,
//         'names': ['Whiskers'],
//         'count': 1
//       },
//     ]);
//   });

//   test('Intersect', () {
//     var a = [0, 1, 2, 3];
//     var b = [5, 4, 3, 2];

//     var result = E(a).intersectE(b);
//     expect(result.toListE(), orderedEquals([2, 3]));

//     var result2 = E(b).intersectE(a);
//     expect(result2.toListE(), orderedEquals([3, 2]));

//     var result3 = E(a).intersectE(a);
//     expect(result3.toListE(), orderedEquals([0, 1, 2, 3]));

//     var c = ['a', 'b', 'c', 'D'];
//     var d = ['C', 'd', 'E', 'F'];

//     var comparer = EqualityComparer<String>(
//       comparer: (a, b) => a.toLowerCase() == b.toLowerCase(),
//       hasher: (s) => s.toLowerCase().hashCode,
//     );
//     var comparer2 = EqualityComparer<String>(
//       comparer: (a, b) => a.toUpperCase() == b.toUpperCase(),
//       hasher: (s) => s.toUpperCase().hashCode,
//     );

//     var result4 = E(c).intersectE(d, comparer: comparer);
//     expect(result4, orderedEquals(['c', 'D']));

//     var result5 = E(d).intersectE(c, comparer: comparer2);
//     expect(result5, orderedEquals(['C', 'd']));

//     var result6 = E(c).intersectE(c, comparer: comparer);
//     expect(result6, orderedEquals(['a', 'b', 'c', 'D']));
//   });

//   test('Join', () {
//     final a = {'1': 1, '2': 2, '3': 3, '4': 4};
//     final b = {'1': 1.0, '2': 2.0, '3': 3.0, '5': 5.0};

//     final output = E(a.entries).joinE(b.entries, (x) => x.key, (y) => y.key,
//         (x, y) => '${x.value}_${y.value}');
//     expect(output, orderedEquals(['1_1.0', '2_2.0', '3_3.0']));
//   });

//   test('Last', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).lastE();
//     expect(result, 3);

//     var test2 = [];
//     var result2 = () => E(test2).lastE();
//     expect(result2, throwsA(isA<EnumerableError>()));

//     var test3 = [0, 1, 2, 3];
//     var result3 = E(test3).lastE(condition: (i) => i.isOdd);
//     expect(result3, 3);
//   });

//   test('LastOrDefault', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).lastOrDefaultE();
//     expect(result, 3);

//     var test2 = [];
//     var result2 = E(test2).lastOrDefaultE();
//     expect(result2, null);

//     var result3 = E(test2).lastOrDefaultE(defaultValue: 4);
//     expect(result3, 4);

//     var test4 = [0, 1, 2, 3];
//     var result4 = E(test4).firstOrDefaultE(condition: (i) => i.isOdd);
//     expect(result4, 1);
//   });

//   test('Max', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).maxE();
//     expect(result, 3);

//     var test2 = <int>[];
//     var result2 = () => E(test2).maxE();
//     expect(result2, throwsA(isA<EnumerableError>()));

//     var test3 = ['0', '1', '2', '3'];
//     var comparer = EqualityComparer<String>(
//         sorter: (a, b) => int.parse(a).compareTo(int.parse(b)));
//     var result3 = E(test3).maxE(comparer);
//     expect(result3, '3');
//   });

//   test('Min', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).minE();
//     expect(result, 0);

//     var test2 = <int>[];
//     var result2 = () => E(test2).minE();
//     expect(result2, throwsA(isA<EnumerableError>()));

//     var test3 = ['0', '1', '2', '3'];
//     var comparer = EqualityComparer<String>(
//         sorter: (a, b) => int.parse(a).compareTo(int.parse(b)));
//     var result3 = E(test3).minE(comparer);
//     expect(result3, '0');
//   });

//   test('OfType', () {
//     var test = [0, 1.0, 2, 3.0];
//     var e = E(test);
//     expect(e, isA<ValueEnumerable<num>>());

//     var result = e.ofTypeE<int>();
//     expect(result, orderedEquals([0, 2]));
//   });

//   test('OrderBy', () {
//     final input = [4, 2, 5, 1, 3];
//     final result = E(input).orderByE((i) => i);

//     expect(result, orderedEquals([1, 2, 3, 4, 5]));
//   });

//   test('OrderByDescending', () {
//     final input = [4, 2, 5, 1, 3];
//     final result = E(input).orderByDescendingE((i) => i);

//     expect(result, orderedEquals([5, 4, 3, 2, 1]));
//   });

//   test('Prepend', () {
//     var list = [0, 1, 2, 3];
//     var result = E(list).prependE(4);
//     expect(result, orderedEquals([4, 0, 1, 2, 3]));
//   });

//   test('Range', () {
//     var list = Enumerable.range(4, 5);
//     expect(list, orderedEquals([4, 5, 6, 7, 8]));
//   });

//   test('Repeat', () {
//     var list = Enumerable.repeat('a', 3);
//     expect(list, orderedEquals(['a', 'a', 'a']));
//   });

//   test('Reverse', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).reverseE();
//     expect(result, orderedEquals([3, 2, 1, 0]));
//   });

//   test('Select', () {
//     final input = ['a', 'b', 'c', 'd', 'e'];
//     final output = E(input).selectE((c) => c.codeUnits[0]);
//     expect(output, orderedEquals([97, 98, 99, 100, 101]));
//   });

//   test('SelectMany', () {
//     final input = [
//       [0, 1, 2, 3, 4],
//       [5, 6, 7, 8, 9],
//       [10, 11, 12, 13, 14],
//     ];
//     final output = E(input).selectManyE((x) => x).toListE();
//     expect(output,
//         orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]));
//   });

//   test('SequenceEqual', () {
//     final input = ['a', 'b', 'c', 'd', 'e'];
//     final output = E(input).sequenceEqualE(['a', 'b', 'c', 'd', 'e']);
//     expect(output, isTrue);

//     final output2 = E(input).sequenceEqualE(['b', 'c', 'd', 'e', 'a']);
//     expect(output2, isFalse);

//     final output3 = E(input).sequenceEqualE(['a', 'b', 'c', 'd']);
//     expect(output3, isFalse);

//     final output4 = E(input).sequenceEqualE(['a', 'b', 'c', 'd', 'e', 'f']);
//     expect(output4, isFalse);
//   });

//   test('Single', () {
//     final input = [0];
//     final output = E(input).singleE();
//     expect(output, equals(0));

//     final input2 = [0, 1];
//     final output2 = () => E(input2).singleE();
//     expect(output2, throwsA(isA<EnumerableError>()));

//     final input3 = [0, 1, 2, 3, 4];
//     final output3 = E(input3).singleE((x) => x == 2);
//     expect(output3, equals(2));

//     final input4 = [0, 1, 2, 3, 4, 2];
//     final output4 = () => E(input4).singleE((x) => x == 2);
//     expect(output4, throwsA(isA<EnumerableError>()));

//     final input5 = [];
//     final output5 = () => E(input5).singleE();
//     expect(output5, throwsA(isA<EnumerableError>()));

//     final input6 = [];
//     final output6 = () => E(input6).singleE((x) => x == 2);
//     expect(output6, throwsA(isA<EnumerableError>()));
//   });

//   test('SingleOrDefault', () {
//     final input = [0];
//     final output = E(input).singleOrDefaultE(5);
//     expect(output, equals(0));

//     final input2 = [0, 1];
//     final output2 = () => E(input2).singleOrDefaultE(5);
//     expect(output2, throwsA(isA<EnumerableError>()));

//     final input3 = [0, 1, 2, 3, 4];
//     final output3 = E(input3).singleOrDefaultE(5, (x) => x == 2);
//     expect(output3, equals(2));

//     final input4 = [0, 1, 2, 3, 4, 2];
//     final output4 = () => E(input4).singleOrDefaultE(5, (x) => x == 2);
//     expect(output4, throwsA(isA<EnumerableError>()));

//     final input5 = [];
//     final output5 = E(input5).singleOrDefaultE(5);
//     expect(output5, 5);

//     final input6 = [];
//     final output6 = E(input6).singleOrDefaultE(5, (x) => x == 2);
//     expect(output6, 5);
//   });

//   test('Skip', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).skipE(3);
//     expect(output, orderedEquals([3, 4, 5]));
//   });

//   test('SkipWhile', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).skipWhileE((x) => x < 3);
//     expect(output, orderedEquals([3, 4, 5]));
//   });

//   test('Sum', () {
//     final input = [1, 2, 3, 4, 5];
//     final output = E(input).sumE();
//     expect(output, 15);

//     final input2 = ['1', '2', '3', '4', '5'];
//     final output2 = E(input2).sumE((x) => int.parse(x));
//     expect(output2, 15);
//   });

//   test('Take', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).takeE(3);
//     expect(output, orderedEquals([0, 1, 2]));
//   });

//   test('TakeWhile', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).takeWhileE((x) => x < 3);
//     expect(output, orderedEquals([0, 1, 2]));
//   });

//   test('ThenBy', () {
//     final barley = Pet()
//       ..name = 'Barley'
//       ..age = 8;
//     final daisy = Pet()
//       ..name = 'Daisy'
//       ..age = 4;
//     final whiskers = Pet()
//       ..name = 'Whiskers'
//       ..age = 1;
//     final boots = Pet()
//       ..name = 'Boots'
//       ..age = 4;

//     final pets = [barley, daisy, whiskers, boots];

//     expect(
//         pets,
//         orderedEquals([
//           barley,
//           daisy,
//           whiskers,
//           boots,
//         ]));

//     final interim = E(pets).orderByE((p) => p.age);

//     expect(
//         interim,
//         orderedEquals([
//           whiskers,
//           daisy,
//           boots,
//           barley,
//         ]));

//     final result = interim.thenByE((p) => p.name);

//     expect(
//         result,
//         orderedEquals([
//           whiskers,
//           boots,
//           daisy,
//           barley,
//         ]));

//     final errorTest =
//         () => E([0, 1, 2]).selectE((i) => i + 1).thenByE((i) => i);
//     expect(errorTest, throwsA(isA<UnsupportedError>()));
//   });

//   test('ThenByDescending', () {
//     final barley = Pet()
//       ..name = 'Barley'
//       ..age = 8;
//     final boots = Pet()
//       ..name = 'Boots'
//       ..age = 4;
//     final daisy = Pet()
//       ..name = 'Daisy'
//       ..age = 4;
//     final whiskers = Pet()
//       ..name = 'Whiskers'
//       ..age = 1;

//     final pets = [barley, boots, daisy, whiskers];

//     expect(
//         pets,
//         orderedEquals([
//           barley,
//           boots,
//           daisy,
//           whiskers,
//         ]));

//     final interim = E(pets).orderByE((p) => p.age);

//     expect(
//         interim,
//         orderedEquals([
//           whiskers,
//           boots,
//           daisy,
//           barley,
//         ]));

//     final result = interim.thenByDescendingE((p) => p.name);

//     expect(
//         result,
//         orderedEquals([
//           whiskers,
//           daisy,
//           boots,
//           barley,
//         ]));

//     final errorTest =
//         () => E([0, 1, 2]).selectE((i) => i + 1).thenByDescendingE((i) => i);
//     expect(errorTest, throwsA(isA<UnsupportedError>()));
//   });

//   test('ToList', () {
//     final input = [1, 2, 3, 4, 5];
//     expect(input, isA<List<int>>());

//     final e = E(input);
//     expect(e, isA<ValueEnumerable<int>>());

//     final result = e.toListE();
//     expect(result, isA<List<int>>());
//     expect(result, orderedEquals([1, 2, 3, 4, 5]));
//   });

//   test('ToMap', () {
//     final input = [1, 2, 3, 4, 5];
//     expect(input, isA<List<int>>());

//     final result = E(input).toMapE((x) => x, (x) => x.toString());
//     expect(result, equals({1: '1', 2: '2', 3: '3', 4: '4', 5: '5'}));
//   });

//   test('ToSet', () {
//     final input = [1, 2, 3, 2, 3];
//     expect(input, isA<List<int>>());

//     final result = E(input).toSetE();
//     expect(result, isA<Set<int>>());
//     expect(result, equals(Set.of([1, 2, 3])));
//   });

//   test('Union', () {
//     var a = [0, 1, 2, 3];
//     var b = [2, 3, 4, 5];

//     var result = E(a).unionE(b);
//     expect(result, orderedEquals([0, 1, 2, 3, 4, 5]));

//     var result2 = E(b).unionE(a);
//     expect(result2, orderedEquals([2, 3, 4, 5, 0, 1]));

//     var result3 = E(a).unionE(a);
//     expect(result3, orderedEquals([0, 1, 2, 3]));

//     var c = ['a', 'b', 'c', 'D'];
//     var d = ['C', 'd', 'E', 'F'];

//     var result4 = E(c).unionE(d);
//     expect(result4, orderedEquals(['a', 'b', 'c', 'D', 'C', 'd', 'E', 'F']));

//     var comparer = EqualityComparer<String>(
//       comparer: (a, b) => a.toLowerCase() == b.toLowerCase(),
//       hasher: (s) => s.toLowerCase().hashCode,
//     );
//     var comparer2 = EqualityComparer<String>(
//       comparer: (a, b) => a.toUpperCase() == b.toUpperCase(),
//       hasher: (s) => s.toUpperCase().hashCode,
//     );

//     var result5 = E(c).unionE(d, comparer: comparer);
//     expect(result5, orderedEquals(['a', 'b', 'c', 'D', 'E', 'F']));

//     var result6 = E(d).unionE(c, comparer: comparer2);
//     expect(result6, orderedEquals(['C', 'd', 'E', 'F', 'a', 'b']));

//     var result7 = E(c).unionE(c, comparer: comparer);
//     expect(result7, orderedEquals(['a', 'b', 'c', 'D']));
//   });

//   test('Where', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).whereE((x) => x.isEven);
//     expect(output, orderedEquals([0, 2, 4]));
//   });

//   test('Zip', () {
//     final a = [1, 2, 3, 4];
//     final b = [5.0, 6.0, 7.0];

//     final output = E(a).zipE(b, (x, y) => '$x-$y');
//     expect(output, orderedEquals(['1-5.0', '2-6.0', '3-7.0']));
//   });

//   // ===========================================================================

//   test('Iterable - first', () {
//     final a = [2, 3, 4, 5, 6];
//     final result = E(a).reverseE().first;
//     expect(result, 6);
//   });

//   test('Iterable - isEmpty', () {
//     final a = [];
//     final result = E(a).isEmpty;
//     expect(result, isTrue);

//     final b = [1];
//     final result2 = E(b).isEmpty;
//     expect(result2, isFalse);

//     final c = [1, 3, 5, 7];
//     final result3 = E(c).whereE((i) => i.isEven).isEmpty;
//     expect(result3, isTrue);
//   });

//   test('Iterable - isNotEmpty', () {
//     final a = [];
//     final result = E(a).isNotEmpty;
//     expect(result, isFalse);

//     final b = [1];
//     final result2 = E(b).isNotEmpty;
//     expect(result2, isTrue);

//     final c = [1, 3, 5, 7];
//     final result3 = E(c).whereE((i) => i.isEven).isNotEmpty;
//     expect(result3, isFalse);
//   });

//   test('Iterable - iterator', () {
//     final a = [1, 2, 3, 4, 5];
//     var idx = 0;
//     for (var i in E(a)) {
//       expect(i, a[idx++]);
//     }
//     expect(idx, 5);

//     final b = ['a', 'b', 'c', 'd', 'e'];
//     idx = 0;
//     final iterator = E(b).selectE((c) => c.toUpperCase()).iterator;
//     expect(iterator, isA<Iterator<String>>());
//     while (iterator.moveNext()) {
//       final current = iterator.current;
//       expect(current, equals(b[idx++].toUpperCase()));
//     }
//     expect(idx, 5);
//   });

//   test('Iterable - last', () {
//     final a = [1, 2, 3, 4, 5];
//     final result = E(a).whereE((i) => i.isEven).last;
//     expect(result, 4);
//   });

//   test('Iterable - length', () {
//     final a = [1, 2, 3, 4, 5];
//     final result = E(a).whereE((i) => i.isEven).length;
//     expect(result, 2);
//   });

//   test('Iterable - single', () {
//     final input = [0];
//     final output = E(input).single;
//     expect(output, equals(0));

//     final input2 = [0, 1];
//     final output2 = () => E(input2).single;
//     expect(output2, throwsA(isA<StateError>()));

//     final input3 = [];
//     final output3 = () => E(input3).single();
//     expect(output3, throwsA(isA<StateError>()));
//   });

//   test('Iterable - any', () {
//     var list3 = [2, 4, 6, 8];
//     var result3 = E(list3).any((x) => x.isOdd);
//     expect(result3, isFalse);

//     var list4 = [2, 4, 6, 7];
//     var result4 = E(list4).any((x) => x.isOdd);
//     expect(result4, isTrue);
//   });

//   test('Iterable - cast', () {
//     var list = <num>[0, 1, 2, 3, 4];

//     var e = list;
//     expect(e, isA<Iterable<num>>());

//     var result = E(list).cast<int>();
//     expect(result, orderedEquals([0, 1, 2, 3, 4]));
//     expect(result, isA<Iterable<int>>());

//     var list2 = <int>[0, 1, 2, 3, 4];
//     var result2 = () => E(list2).cast<String>();
//     expect(result2, throwsA(isA<CastError>()));
//   });

//   test('Iterable - contains', () {
//     var list = [0, 1, 2, 3, 4];
//     var result = E(list).contains(2);
//     expect(result, isTrue);

//     var result2 = E(list).contains(5);
//     expect(result2, isFalse);
//   });

//   test('Iterable - elementAt', () {
//     var list = <int>[0, 1, 2, 3, 4];
//     var result = E(list).elementAt(3);
//     expect(result, equals(3));

//     var result2 = () => E(list).elementAt(6);
//     expect(result2, throwsA(isA<RangeError>()));
//   });

//   test('Iterable - every', () {
//     var list = [2, 4, 6, 8];
//     var result = E(list).every((x) => x.isEven);
//     expect(result, isTrue);

//     var list2 = [2, 4, 6, 7];
//     var result2 = E(list2).every((x) => x.isEven);
//     expect(result2, isFalse);
//   });

//   test('Iterable - expand', () {
//     final list = [1, 2, 3, 4, 5];
//     final result =
//         E(list).selectE((i) => [i * 2, i * 2 + 1]).expand((pair) => pair);
//     expect(result, orderedEquals([2, 3, 4, 5, 6, 7, 8, 9, 10, 11]));
//   });

//   test('Iterable - firstWhere', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).firstWhere((i) => i.isOdd);
//     expect(result, 1);
//   });

//   test('Iterable - fold', () {
//     var list = [0, 1, 2, 3, 4];
//     var result = E(list).fold(0, (a, b) => a + b);
//     expect(result, equals(10));

//     var list2 = ['a', 'b', 'c', 'd', 'e'];
//     var result2 = E(list2).fold('xyz', (a, b) => a + b);
//     expect(result2, equals('xyzabcde'));
//   });

//   test('Iterable - followedBy', () {
//     var list = [1, 2, 3];
//     var result = E(list).followedBy([4, 5, 6]);
//     expect(result, orderedEquals([1, 2, 3, 4, 5, 6]));
//   });

//   test('Iterable - forEach', () {
//     var list = [1, 2, 3, 4, 5];
//     var idx = 0;
//     E(list).forEach((i) {
//       expect(i, list[idx++]);
//     });
//     expect(idx, 5);
//   });

//   test('Iterable - join', () {
//     var list = [1, 2, 3, 4, 5];
//     var result = E(list).join('-');
//     expect(result, '1-2-3-4-5');
//   });

//   test('Iterable - lastWhere', () {
//     var test = [0, 1, 2, 3];
//     var result = E(test).lastWhere((i) => i.isOdd);
//     expect(result, 3);
//   });

//   test('Iterable - map', () {
//     final input = ['a', 'b', 'c', 'd', 'e'];
//     final output = E(input).map((c) => c.codeUnits[0]);
//     expect(output, orderedEquals([97, 98, 99, 100, 101]));
//   });

//   test('Iterable - reduce', () {
//     var list = [0, 1, 2, 3, 4];
//     var result = E(list).reduce((a, b) => a + b);
//     expect(result, equals(10));

//     var list2 = ['a', 'b', 'c', 'd', 'e'];
//     var result2 = E(list2).reduce((a, b) => a + b);
//     expect(result2, equals('abcde'));
//   });

//   test('Iterable - singleWhere', () {
//     final input = [0, 1, 2, 3, 4];
//     final output = E(input).singleWhere((x) => x == 2);
//     expect(output, equals(2));

//     final input2 = [0, 1, 2, 3, 4, 2];
//     final output2 = () => E(input2).singleWhere((x) => x == 2);
//     expect(output2, throwsA(isA<StateError>()));

//     final input3 = [];
//     final output3 = () => E(input3).singleWhere((x) => x == 2);
//     expect(output3, throwsA(isA<StateError>()));
//   });

//   test('Iterable - skip', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).skip(3);
//     expect(output, orderedEquals([3, 4, 5]));
//   });

//   test('Iterable - skipWhile', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).skipWhile((x) => x < 3);
//     expect(output, orderedEquals([3, 4, 5]));
//   });

//   test('Iterable - take', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).take(3);
//     expect(output, orderedEquals([0, 1, 2]));
//   });

//   test('Iterable - takeWhile', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).takeWhile((x) => x < 3);
//     expect(output, orderedEquals([0, 1, 2]));
//   });

//   test('Iterable - toList', () {
//     final input = [1, 2, 3, 4, 5];
//     expect(input, isA<List<int>>());

//     final e = E(input);
//     expect(e, isA<ValueEnumerable<int>>());

//     final result = e.toList();
//     expect(result, isA<List<int>>());
//     expect(result, orderedEquals([1, 2, 3, 4, 5]));
//   });

//   test('Iterable - toSet', () {
//     final input = [1, 2, 3, 2, 3];
//     expect(input, isA<List<int>>());

//     final result = E(input).toSet();
//     expect(result, isA<Set<int>>());
//     expect(result, equals(Set.of([1, 2, 3])));
//   });

//   test('Iterable - toString', () {
//     final input = [1, 2, 3, 4, 5];
//     final result = E(input).toString();
//     expect(result, '(1, 2, 3, 4, 5)');
//   });

//   test('Iterable - where', () {
//     final input = [0, 1, 2, 3, 4, 5];
//     final output = E(input).where((x) => x.isEven);
//     expect(output, orderedEquals([0, 2, 4]));
//   });

//   test('Iterable - whereType', () {
//     var test = [0, 1.0, 2, 3.0];
//     var e = E(test);
//     expect(e, isA<ValueEnumerable<num>>());

//     var result = e.whereType<int>();
//     expect(result, orderedEquals([0, 2]));
//   });

//   // ===========================================================================

//   test('EqualityComparer', () {
//     final barley = Pet()
//       ..name = 'Barley'
//       ..age = 8;
//     final boots = Pet()
//       ..name = 'Boots'
//       ..age = 4;
//     final whiskers = Pet()
//       ..name = 'Whiskers'
//       ..age = 1;
//     final daisy = Pet()
//       ..name = 'Daisy'
//       ..age = 4;

//     final pets = [whiskers, barley, daisy, boots];

//     final results = E(pets).orderByE((p) => p);
//     expect(results, orderedEquals([whiskers, barley, daisy, boots]));

//     EqualityComparer.registerEqualityComparer(EqualityComparer<Pet>(
//       comparer: (left, right) => left.name == right.name,
//       hasher: (value) => value.name.hashCode,
//       sorter: (left, right) => left.name.compareTo(right.name),
//     ));

//     expect(results, orderedEquals([barley, boots, daisy, whiskers]));

//     EqualityComparer.unregisterEqualityComparer<Pet>();

//     expect(results, orderedEquals([whiskers, barley, daisy, boots]));
//   });
// }

// class Person {
//   String name;
// }

// class Pet {
//   String name;
//   double age;
//   Person owner;

//   bool operator ==(dynamic other) {
//     if (other is Pet) {
//       return name == other.name && age == other.age && owner == other.owner;
//     }
//     return false;
//   }

//   @override
//   String toString() => '{name: $name, age: $age, owner: $owner}';
// }
