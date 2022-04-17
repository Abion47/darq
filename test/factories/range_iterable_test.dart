import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('RangeIterable', () {
    test('Creating a range iterable', () {
      final e = RangeIterable(2, 5);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[2, 3, 4]));
      // Negative inclusive interval behavior

      // Default count behavior

      // Zero count behavior

      // Default count interval behavior

      // Negative count interval behavior

      // End < Start error
      expect(() => RangeIterable(5, 2), throwsA(isA<AssertionError>()));

      // Zero interval error
      expect(
          () => RangeIterable(2, 5, step: 0), throwsA(isA<AssertionError>()));
    });

    test('Creating an inclusive range iterable', () {
      final e = RangeIterable(2, 5, inclusive: true);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[2, 3, 4, 5]));
    });

    test('Creating a range iterable with step', () {
      final e = RangeIterable(2, 5, step: 2);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[2, 4]));
    });

    test('Creating a range iterable with negative step', () {
      final e = RangeIterable(2, 5, step: -1);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[4, 3, 2]));
    });

    test('Creating an inclusive range iterable with negative step', () {
      final e = RangeIterable(2, 5, step: -1, inclusive: true);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[5, 4, 3, 2]));
    });

    test('Creating a range iterable from count', () {
      final e = RangeIterable.count(2, 5);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[2, 3, 4, 5, 6]));
    });

    test('Creating a range iterable from zero count', () {
      final e = RangeIterable.count(2, 0);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[]));
    });

    test('Creating a range iterable from count with step', () {
      final e = RangeIterable.count(2, 5, step: 2);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[2, 4, 6, 8, 10]));
    });

    test('Creating a range iterable from count with negative step', () {
      final e = RangeIterable.count(2, 5, step: -1);
      expect(e, isA<Iterable<int>>());
      expect(e, orderedEquals(<int>[2, 1, 0, -1, -2]));
    });

    test('Error: end < start', () {
      void task() => RangeIterable(5, 2);
      expect(task, throwsA(isA<AssertionError>()));
    });

    test('Error: zero interval', () {
      void task() => RangeIterable(2, 5, step: 0);
      expect(task, throwsA(isA<AssertionError>()));
    });
  });
}
