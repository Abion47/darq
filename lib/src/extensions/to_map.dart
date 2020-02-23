import 'to_linked_hash_map.dart';

extension ToMapExtension<T> on Iterable<T> {
  /// Converts the iterable to a [Map].
  ///
  /// Iterates over the entire iterable, generating a [MapEntry] from each
  /// element with the [entrySelector] function then saving each generated
  /// entry in a [Map] under the generated key.
  ///
  /// If a duplicate key is produced, the value generated by a prior element is
  /// overwritten. As such, the length of the resulting [Map] is not guaranteed
  /// to be the same length as the iterable.
  ///
  /// (This method is equivalent to calling [toLinkedHashMap].)
  ///
  /// Example:
  ///
  ///     void main() {
  ///       var list = [97, 98, 99];
  ///       var result = list.toMap((x) => MapEntry(x, String.fromCodeUnit(x)));
  ///
  ///       // Result: { 97: 'a', 98: 'b', 99: 'c' }
  ///     }
  Map<TKey, TValue> toMap<TKey, TValue>(
    MapEntry<TKey, TValue> Function(T) entrySelector, {
    bool modifiable = false,
  }) =>
      toLinkedHashMap(entrySelector, modifiable: modifiable);
}
