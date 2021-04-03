extension OfTypeExtension<T> on Iterable<T> {
  /// Returns all elements in the iterable that are castable to the specified
  /// type.
  ///
  /// After applying [ofType] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `TResult`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to `TResult`,
  /// the resulting iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <num>[0, 1.0, 2, 3.5];
  ///       final result = list.ofType<int>();
  ///
  ///       // Result: [0, 2]
  ///     }
  ///
  /// (This is a convenience method to maintain naming-consistency with its .NET LINQ equivalent.
  /// Internally it functions identically to [whereType].)
  Iterable<TOther> ofType<TOther>() {
    return whereType<TOther>();
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType2] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1` or `T2`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <Object>[0, 1.2, 'a', true];
  ///       final result = list.ofType<int, double>();
  ///
  ///       // Result: [0, 1.2]
  ///     }
  Iterable<T> ofType2<T1, T2>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType3] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, or `T3`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <Object>[0, 1.2, 'a', true];
  ///       final result = list.ofType3<int, double, String>();
  ///
  ///       // Result: [0, 1.2, 'a']
  ///     }
  Iterable<T> ofType3<T1, T2, T3>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2 || o is T3) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType4] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, or `T4`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType4<T1, T2, T3, T4>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2 || o is T3 || o is T4) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType5] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4` or `T5`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType5<T1, T2, T3, T4, T5>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2 || o is T3 || o is T4 || o is T5) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType6] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4`, `T5` or `T6`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType6<T1, T2, T3, T4, T5, T6>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2 || o is T3 || o is T4 || o is T5 || o is T6) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType7] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4`, `T5`, `T6` or `T7`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType7<T1, T2, T3, T4, T5, T6, T7>() sync* {
    for (var o in this) {
      if (o is T1 ||
          o is T2 ||
          o is T3 ||
          o is T4 ||
          o is T5 ||
          o is T6 ||
          o is T7) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType8] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4`, `T5`, `T6`, `T7` or `T8`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType8<T1, T2, T3, T4, T5, T6, T7, T8>() sync* {
    for (var o in this) {
      if (o is T1 ||
          o is T2 ||
          o is T3 ||
          o is T4 ||
          o is T5 ||
          o is T6 ||
          o is T7 ||
          o is T8) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType9] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4`, `T5`, `T6`, `T7`, `T8` or `T9`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType9<T1, T2, T3, T4, T5, T6, T7, T8, T9>() sync* {
    for (var o in this) {
      if (o is T1 ||
          o is T2 ||
          o is T3 ||
          o is T4 ||
          o is T5 ||
          o is T6 ||
          o is T7 ||
          o is T8 ||
          o is T9) {
        yield o;
      }
    }
  }
}
