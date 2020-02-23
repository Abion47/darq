/// Provides the extension methods on `String`.
extension StringExtension on String {
  /// Returns an iterable that returns every character in this
  /// string, split along UTF-16 code units.
  ///
  /// This iterable will return each individial code unit as a
  /// separate element. As such, rune boundaries may not be
  /// respected and any surrogate pairs will be divided.
  Iterable<String> get iterable {
    return codeUnits.map((u) => String.fromCharCode(u));
  }

  /// Returns an iterable that returns every character in this
  /// string, split along rune boundaries.
  ///
  /// This iterable will respect the boundaries between elements
  /// that form surrogate pairs.
  Iterable<String> get iterableRunes {
    return runes.map((r) => String.fromCharCode(r));
  }
}
