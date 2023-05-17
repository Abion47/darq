import 'package:darq/src/utility/tuple.dart';

extension DarqMapExtension<TKey, TValue> on Map<TKey, TValue> {
  /// Returns an iterable that returns every key-value pair in this map as a
  /// named record.
  ///
  /// The returned records will each have the key and value of each `MapEntry`
  /// mapped to the `key` and `value` fields of the record. This is for convenience
  /// when iterating on the entries of the map as the records can then be directly
  /// deconstructed.
  Iterable<({TKey key, TValue value})> get entryRecords {
    return entries.map((e) => (key: e.key, value: e.value));
  }

  /// Returns an iterable that returns every key-value pair in this map as a
  /// two-dimensional `Tuple2`.
  ///
  /// The returned tuples will each have the key and value of each `MapEntry`
  /// mapped to the `item0` and `item1` fields of the tuple. This is for convenience
  /// when iterating on the entries of the map in a setting where working with
  /// tuples is desired.
  Iterable<Tuple2<TKey, TValue>> get entryTuples {
    return entries.map((e) => Tuple2(e.key, e.value));
  }
}
