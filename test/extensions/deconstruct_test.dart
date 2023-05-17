import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group("deconstruct", () {
    test("deconstruct1", () {
      final list = [(1,), (2,), (3,)];
      final dest = list.deconstruct();

      expect(dest, isA<(Iterable<int>,)>());

      final (ints,) = dest;
      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));
    });

    test("deconstruct2", () {
      final list = [(1, 1.1), (2, 2.2), (3, 3.3)];
      final dest = list.deconstruct();

      expect(dest, isA<(Iterable<int>, Iterable<double>)>());

      final (ints, doubles) = dest;

      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));

      expect(doubles, isA<Iterable<double>>());
      expect(doubles, orderedEquals([1.1, 2.2, 3.3]));
    });

    test("deconstruct3", () {
      final list = [(1, 1.1, 'a'), (2, 2.2, 'b'), (3, 3.3, 'c')];
      final dest = list.deconstruct();

      expect(dest, isA<(Iterable<int>, Iterable<double>, Iterable<String>)>());

      final (ints, doubles, strings) = dest;

      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));

      expect(doubles, isA<Iterable<double>>());
      expect(doubles, orderedEquals([1.1, 2.2, 3.3]));

      expect(strings, isA<Iterable<String>>());
      expect(strings, orderedEquals(['a', 'b', 'c']));
    });

    test("deconstruct4", () {
      final list = [
        (1, 1.1, 'a', false),
        (2, 2.2, 'b', true),
        (3, 3.3, 'c', false)
      ];
      final dest = list.deconstruct();

      expect(
          dest,
          isA<
              (
                Iterable<int>,
                Iterable<double>,
                Iterable<String>,
                Iterable<bool>
              )>());

      final (ints, doubles, strings, bools) = dest;

      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));

      expect(doubles, isA<Iterable<double>>());
      expect(doubles, orderedEquals([1.1, 2.2, 3.3]));

      expect(strings, isA<Iterable<String>>());
      expect(strings, orderedEquals(['a', 'b', 'c']));

      expect(bools, isA<Iterable<bool>>());
      expect(bools, orderedEquals([false, true, false]));
    });

    test("deconstruct5", () {
      final list = [
        (1, 1.1, 'a', false, const Symbol('a')),
        (2, 2.2, 'b', true, const Symbol('b')),
        (3, 3.3, 'c', false, const Symbol('c'))
      ];
      final dest = list.deconstruct();

      expect(
          dest,
          isA<
              (
                Iterable<int>,
                Iterable<double>,
                Iterable<String>,
                Iterable<bool>,
                Iterable<Symbol>,
              )>());

      final (ints, doubles, strings, bools, symbols) = dest;

      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));

      expect(doubles, isA<Iterable<double>>());
      expect(doubles, orderedEquals([1.1, 2.2, 3.3]));

      expect(strings, isA<Iterable<String>>());
      expect(strings, orderedEquals(['a', 'b', 'c']));

      expect(bools, isA<Iterable<bool>>());
      expect(bools, orderedEquals([false, true, false]));

      expect(symbols, isA<Iterable<Symbol>>());
      expect(
          symbols,
          orderedEquals([
            const Symbol('a'),
            const Symbol('b'),
            const Symbol('c'),
          ]));
    });

    test("deconstruct6", () {
      final list = [
        (1, 1.1, 'a', false, const Symbol('a'), BigInt.zero),
        (2, 2.2, 'b', true, const Symbol('b'), BigInt.one),
        (3, 3.3, 'c', false, const Symbol('c'), BigInt.two)
      ];
      final dest = list.deconstruct();

      expect(
          dest,
          isA<
              (
                Iterable<int>,
                Iterable<double>,
                Iterable<String>,
                Iterable<bool>,
                Iterable<Symbol>,
                Iterable<BigInt>,
              )>());

      final (ints, doubles, strings, bools, symbols, bigints) = dest;

      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));

      expect(doubles, isA<Iterable<double>>());
      expect(doubles, orderedEquals([1.1, 2.2, 3.3]));

      expect(strings, isA<Iterable<String>>());
      expect(strings, orderedEquals(['a', 'b', 'c']));

      expect(bools, isA<Iterable<bool>>());
      expect(bools, orderedEquals([false, true, false]));

      expect(symbols, isA<Iterable<Symbol>>());
      expect(
          symbols,
          orderedEquals([
            const Symbol('a'),
            const Symbol('b'),
            const Symbol('c'),
          ]));

      expect(bigints, isA<Iterable<BigInt>>());
      expect(bigints, orderedEquals([BigInt.zero, BigInt.one, BigInt.two]));
    });

    test("deconstruct7", () {
      final list = [
        (1, 1.1, 'a', false, const Symbol('a'), BigInt.zero, const Tuple1(0)),
        (2, 2.2, 'b', true, const Symbol('b'), BigInt.one, const Tuple1(1)),
        (3, 3.3, 'c', false, const Symbol('c'), BigInt.two, const Tuple1(2))
      ];
      final dest = list.deconstruct();

      expect(
          dest,
          isA<
              (
                Iterable<int>,
                Iterable<double>,
                Iterable<String>,
                Iterable<bool>,
                Iterable<Symbol>,
                Iterable<BigInt>,
                Iterable<Tuple1<int>>,
              )>());

      final (ints, doubles, strings, bools, symbols, bigints, tuples) = dest;

      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));

      expect(doubles, isA<Iterable<double>>());
      expect(doubles, orderedEquals([1.1, 2.2, 3.3]));

      expect(strings, isA<Iterable<String>>());
      expect(strings, orderedEquals(['a', 'b', 'c']));

      expect(bools, isA<Iterable<bool>>());
      expect(bools, orderedEquals([false, true, false]));

      expect(symbols, isA<Iterable<Symbol>>());
      expect(
          symbols,
          orderedEquals([
            const Symbol('a'),
            const Symbol('b'),
            const Symbol('c'),
          ]));

      expect(bigints, isA<Iterable<BigInt>>());
      expect(bigints, orderedEquals([BigInt.zero, BigInt.one, BigInt.two]));

      expect(tuples, isA<Iterable<Tuple1<int>>>());
      expect(
          tuples,
          orderedEquals([
            const Tuple1(0),
            const Tuple1(1),
            const Tuple1(2),
          ]));
    });

    test("deconstruct8", () {
      final list = [
        (
          1,
          1.1,
          'a',
          false,
          const Symbol('a'),
          BigInt.zero,
          const Tuple1(0),
          const <int>[0]
        ),
        (
          2,
          2.2,
          'b',
          true,
          const Symbol('b'),
          BigInt.one,
          const Tuple1(1),
          const <int>[1]
        ),
        (
          3,
          3.3,
          'c',
          false,
          const Symbol('c'),
          BigInt.two,
          const Tuple1(2),
          const <int>[2]
        )
      ];
      final dest = list.deconstruct();

      expect(
          dest,
          isA<
              (
                Iterable<int>,
                Iterable<double>,
                Iterable<String>,
                Iterable<bool>,
                Iterable<Symbol>,
                Iterable<BigInt>,
                Iterable<Tuple1<int>>,
                Iterable<List<int>>,
              )>());

      final (ints, doubles, strings, bools, symbols, bigints, tuples, lists) =
          dest;

      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));

      expect(doubles, isA<Iterable<double>>());
      expect(doubles, orderedEquals([1.1, 2.2, 3.3]));

      expect(strings, isA<Iterable<String>>());
      expect(strings, orderedEquals(['a', 'b', 'c']));

      expect(bools, isA<Iterable<bool>>());
      expect(bools, orderedEquals([false, true, false]));

      expect(symbols, isA<Iterable<Symbol>>());
      expect(
          symbols,
          orderedEquals([
            const Symbol('a'),
            const Symbol('b'),
            const Symbol('c'),
          ]));

      expect(bigints, isA<Iterable<BigInt>>());
      expect(bigints, orderedEquals([BigInt.zero, BigInt.one, BigInt.two]));

      expect(tuples, isA<Iterable<Tuple1<int>>>());
      expect(
          tuples,
          orderedEquals([
            const Tuple1(0),
            const Tuple1(1),
            const Tuple1(2),
          ]));

      expect(lists, isA<Iterable<List<int>>>());
      expect(
          lists,
          orderedEquals([
            const [0],
            const [1],
            const [2],
          ]));
    });

    test("deconstruct9", () {
      final list = [
        (
          1,
          1.1,
          'a',
          false,
          const Symbol('a'),
          BigInt.zero,
          const Tuple1(0),
          const <int>[0],
          const <int>{0},
        ),
        (
          2,
          2.2,
          'b',
          true,
          const Symbol('b'),
          BigInt.one,
          const Tuple1(1),
          const <int>[1],
          const <int>{1},
        ),
        (
          3,
          3.3,
          'c',
          false,
          const Symbol('c'),
          BigInt.two,
          const Tuple1(2),
          const <int>[2],
          const <int>{2},
        )
      ];
      final dest = list.deconstruct();

      expect(
          dest,
          isA<
              (
                Iterable<int>,
                Iterable<double>,
                Iterable<String>,
                Iterable<bool>,
                Iterable<Symbol>,
                Iterable<BigInt>,
                Iterable<Tuple1<int>>,
                Iterable<List<int>>,
                Iterable<Set<int>>,
              )>());

      final (
        ints,
        doubles,
        strings,
        bools,
        symbols,
        bigints,
        tuples,
        lists,
        sets
      ) = dest;

      expect(ints, isA<Iterable<int>>());
      expect(ints, orderedEquals([1, 2, 3]));

      expect(doubles, isA<Iterable<double>>());
      expect(doubles, orderedEquals([1.1, 2.2, 3.3]));

      expect(strings, isA<Iterable<String>>());
      expect(strings, orderedEquals(['a', 'b', 'c']));

      expect(bools, isA<Iterable<bool>>());
      expect(bools, orderedEquals([false, true, false]));

      expect(symbols, isA<Iterable<Symbol>>());
      expect(
          symbols,
          orderedEquals([
            const Symbol('a'),
            const Symbol('b'),
            const Symbol('c'),
          ]));

      expect(bigints, isA<Iterable<BigInt>>());
      expect(bigints, orderedEquals([BigInt.zero, BigInt.one, BigInt.two]));

      expect(tuples, isA<Iterable<Tuple1<int>>>());
      expect(
          tuples,
          orderedEquals([
            const Tuple1(0),
            const Tuple1(1),
            const Tuple1(2),
          ]));

      expect(lists, isA<Iterable<List<int>>>());
      expect(
          lists,
          orderedEquals([
            const [0],
            const [1],
            const [2],
          ]));

      expect(sets, isA<Iterable<Set<int>>>());
      expect(
          sets,
          orderedEquals([
            const {0},
            const {1},
            const {2},
          ]));
    });
  });
}
