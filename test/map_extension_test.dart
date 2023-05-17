import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group("Map Extensions", () {
    test("entryRecords", () {
      final map = {"a": 1, "b": 2, "c": 3};
      final entries = map.entryRecords;

      expect(entries, isA<Iterable<({String key, int value})>>());
      expect(entries.length, 3);
      expect(
        entries,
        orderedEquals(
          <({String key, int value})>[
            (key: "a", value: 1),
            (key: "b", value: 2),
            (key: "c", value: 3),
          ],
        ),
      );

      for (final (:key, :value) in entries) {
        expect(key, isA<String>());
        expect(value, isA<int>());
      }
    });

    test("entryTuples", () {
      final map = {"a": 1, "b": 2, "c": 3};
      final entries = map.entryTuples;

      expect(entries, isA<Iterable<Tuple2<String, int>>>());
      expect(entries.length, 3);
      expect(
        entries,
        orderedEquals(
          <Tuple2<String, int>>[
            Tuple.t2("a", 1),
            Tuple.t2("b", 2),
            Tuple.t2("c", 3),
          ],
        ),
      );

      for (final Tuple2(item0: key, item1: value) in entries) {
        expect(key, isA<String>());
        expect(value, isA<int>());
      }
    });
  });
}
