import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('Tuple', () {
    test('Static constructors', () {
      expect(Tuple.t0(), isA<Tuple0>());
      expect(Tuple.t1(1), isA<Tuple1<int>>());
      expect(Tuple.t2(1, 2), isA<Tuple2<int, int>>());
      expect(Tuple.t3(1, 2, 3), isA<Tuple3<int, int, int>>());
      expect(Tuple.t4(1, 2, 3, 4), isA<Tuple4<int, int, int, int>>());
      expect(Tuple.t5(1, 2, 3, 4, 5), isA<Tuple5<int, int, int, int, int>>());
      expect(Tuple.t6(1, 2, 3, 4, 5, 6),
          isA<Tuple6<int, int, int, int, int, int>>());
      expect(Tuple.t7(1, 2, 3, 4, 5, 6, 7),
          isA<Tuple7<int, int, int, int, int, int, int>>());
      expect(Tuple.t8(1, 2, 3, 4, 5, 6, 7, 8),
          isA<Tuple8<int, int, int, int, int, int, int, int>>());
      expect(Tuple.t9(1, 2, 3, 4, 5, 6, 7, 8, 9),
          isA<Tuple9<int, int, int, int, int, int, int, int, int>>());
    });

    test('JSON factory', () {
      // Regular factories
      var t = Tuple.fromJson({});
      expect(t, isA<Tuple0>());
      expect(t, []);

      t = Tuple.fromJson({
        'item': 1,
      });
      expect(t, isA<Tuple1<dynamic>>());
      expect(t, [1]);

      t = Tuple.fromJson({
        'item0': 1,
      });
      expect(t, isA<Tuple1<dynamic>>());
      expect(t, [1]);

      t = Tuple.fromJson({
        'item0': 1,
        'item1': 2,
      });
      expect(t, isA<Tuple2<dynamic, dynamic>>());
      expect(t, [1, 2]);

      t = Tuple.fromJson({
        'item0': 1,
        'item1': 2,
        'item2': 3,
      });
      expect(t, isA<Tuple3<dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3]);

      t = Tuple.fromJson({
        'item0': 1,
        'item1': 2,
        'item2': 3,
        'item3': 4,
      });
      expect(t, isA<Tuple4<dynamic, dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4]);

      t = Tuple.fromJson({
        'item0': 1,
        'item1': 2,
        'item2': 3,
        'item3': 4,
        'item4': 5,
      });
      expect(t, isA<Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4, 5]);

      t = Tuple.fromJson({
        'item0': 1,
        'item1': 2,
        'item2': 3,
        'item3': 4,
        'item4': 5,
        'item5': 6,
      });
      expect(t,
          isA<Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4, 5, 6]);

      t = Tuple.fromJson({
        'item0': 1,
        'item1': 2,
        'item2': 3,
        'item3': 4,
        'item4': 5,
        'item5': 6,
        'item6': 7,
      });
      expect(
          t,
          isA<
              Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic>>());
      expect(t, [1, 2, 3, 4, 5, 6, 7]);

      t = Tuple.fromJson({
        'item0': 1,
        'item1': 2,
        'item2': 3,
        'item3': 4,
        'item4': 5,
        'item5': 6,
        'item6': 7,
        'item7': 8,
      });
      expect(
          t,
          isA<
              Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4, 5, 6, 7, 8]);

      t = Tuple.fromJson({
        'item0': 1,
        'item1': 2,
        'item2': 3,
        'item3': 4,
        'item4': 5,
        'item5': 6,
        'item6': 7,
        'item7': 8,
        'item8': 9,
      });
      expect(
          t,
          isA<
              Tuple9<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4, 5, 6, 7, 8, 9]);

      // Forced length factories
      final ref = {
        'item0': 1,
        'item1': 2,
        'item2': 3,
        'item3': 4,
        'item4': 5,
        'item5': 6,
        'item6': 7,
        'item7': 8,
        'item8': 9,
      };

      expect(Tuple.fromJson(ref, forceLength: 0), isA<Tuple0>());
      expect(Tuple.fromJson(ref, forceLength: 1), isA<Tuple1<dynamic>>());
      expect(
          Tuple.fromJson(ref, forceLength: 2), isA<Tuple2<dynamic, dynamic>>());
      expect(Tuple.fromJson(ref, forceLength: 3),
          isA<Tuple3<dynamic, dynamic, dynamic>>());
      expect(Tuple.fromJson(ref, forceLength: 4),
          isA<Tuple4<dynamic, dynamic, dynamic, dynamic>>());
      expect(Tuple.fromJson(ref, forceLength: 5),
          isA<Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic>>());
      expect(Tuple.fromJson(ref, forceLength: 6),
          isA<Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>>());
      expect(
          Tuple.fromJson(ref, forceLength: 7),
          isA<
              Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic>>());
      expect(
          Tuple.fromJson(ref, forceLength: 8),
          isA<
              Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic>>());
      expect(
          Tuple.fromJson(ref, forceLength: 9),
          isA<
              Tuple9<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic, dynamic>>());

      // Errors
      void negativeFixedLengthTask() => Tuple.fromJson({}, forceLength: -1);
      expect(negativeFixedLengthTask, throwsA(isA<ArgumentError>()));

      void tooLongFixedLengthTask() => Tuple.fromJson({}, forceLength: 10);
      expect(tooLongFixedLengthTask, throwsA(isA<UnsupportedError>()));
    });

    test('List factory', () {
      // Regular factories
      var t = Tuple.fromList([]);
      expect(t, isA<Tuple0>());
      expect(t, []);

      t = Tuple.fromList([1]);
      expect(t, isA<Tuple1<dynamic>>());
      expect(t, [1]);

      t = Tuple.fromList([1, 2]);
      expect(t, isA<Tuple2<dynamic, dynamic>>());
      expect(t, [1, 2]);

      t = Tuple.fromList([1, 2, 3]);
      expect(t, isA<Tuple3<dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3]);

      t = Tuple.fromList([1, 2, 3, 4]);
      expect(t, isA<Tuple4<dynamic, dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4]);

      t = Tuple.fromList([1, 2, 3, 4, 5]);
      expect(t, isA<Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4, 5]);

      t = Tuple.fromList([1, 2, 3, 4, 5, 6]);
      expect(t,
          isA<Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4, 5, 6]);

      t = Tuple.fromList([1, 2, 3, 4, 5, 6, 7]);
      expect(
          t,
          isA<
              Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic>>());
      expect(t, [1, 2, 3, 4, 5, 6, 7]);

      t = Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8]);
      expect(
          t,
          isA<
              Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4, 5, 6, 7, 8]);

      t = Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9]);
      expect(
          t,
          isA<
              Tuple9<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic, dynamic>>());
      expect(t, [1, 2, 3, 4, 5, 6, 7, 8, 9]);

      // Fixed length factories
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 0),
          isA<Tuple0>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 1),
          isA<Tuple1<dynamic>>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 2),
          isA<Tuple2<dynamic, dynamic>>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 3),
          isA<Tuple3<dynamic, dynamic, dynamic>>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 4),
          isA<Tuple4<dynamic, dynamic, dynamic, dynamic>>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 5),
          isA<Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic>>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 6),
          isA<Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 7),
          isA<
              Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic>>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 8),
          isA<
              Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic>>());
      expect(
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 9),
          isA<
              Tuple9<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic, dynamic>>());

      // Errors
      void tooLongTask() => Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(tooLongTask, throwsA(isA<UnsupportedError>()));

      void negativeFixedLengthTask() =>
          Tuple.fromList([1], truncateToLength: -1);
      expect(negativeFixedLengthTask, throwsA(isA<ArgumentError>()));

      void tooShortListFixedLengthTask() =>
          Tuple.fromList([1], truncateToLength: 3);
      expect(tooShortListFixedLengthTask, throwsA(isA<ArgumentError>()));

      void tooLongFixedLengthTask() =>
          Tuple.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], truncateToLength: 10);
      expect(tooLongFixedLengthTask, throwsA(isA<UnsupportedError>()));
    });
  });
}
