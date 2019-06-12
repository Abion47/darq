import 'typedefs.dart';

/// Used in various enumeration methods for allowing user-defined comparisons
/// between complex elements.
///
/// [EqualityComparer] exposes three different forms of comparison - equivalency,
/// ordering, and hashing. Any of the options can be omitted when creating an
/// [EqualityComparer] instance, in which case the omitted options will revert
/// to default behavior as outlined below.
///
/// The [EqualityComparer.compare] field tests equivalency. Two elements of a
/// given type are passed to the function, and the function returns whether or
/// not the elements are deemed equal. If omitted, the function will default to
/// checking for strict equivalency by using the `==` operator.
///
/// ```dart
/// (left, right) { return left == right; }
/// ```
///
/// The [EqualityComparer.hash] field generates hash codes. An element is passed
/// to the function and the function returns an integer value that represents
/// the element's hash code. If omitted, the function will default to calling the
/// object's `hashCode` property:
///
/// ```dart
/// (value) { return value.hashCode; }
/// ```
///
/// The [EqualityComparer.sort] field tests for sorting order. Two elements of a
/// given type are passed to the function, and the function returns an integer
/// that represents the sorting order of the elements. If the left value is lesser
/// than the right value, the returned integer is negative. If the left value is
/// greater than the right value, the returned integer is positive. If the two
/// values are equal, 0 is returned. (This behavior is identical to various
/// `compareTo` methods on Dart types.)
///
/// If the [EqualityComparer.sort] field is omitted, the function's default
/// behavior depends on the type argument passed to [EqualityComparer]:
///
/// - `int` will default to using [int.compareTo]
/// - `num` will default to using [num.compareTo]
/// - `double` will default to using [double.compareTo]
/// - `String` will default to using [String.compareTo]
/// - All other types will default to a non-sorting function:
///
/// ```dart
/// (left, right) { return 0; }
/// ```
class EqualityComparer<T> {
  final Comparer<T> compare;
  final Hasher<T> hash;
  final Sorter<T> sort;

  EqualityComparer({
    Comparer<T> comparer,
    Hasher<T> hasher,
    Sorter<T> sorter,
  })  : this.compare = comparer ?? _getDefaultComparer<T>(),
        this.hash = hasher ?? _getDefaultHasher<T>(),
        this.sort = sorter ?? _getDefaultSorter<T>();

  static EqualityComparer<T> forType<T>() => EqualityComparer<T>(
        comparer: null,
        hasher: null,
        sorter: null,
      );

  static Comparer<T> _getDefaultComparer<T>() =>
      (T left, T right) => left == right;
  static Hasher<T> _getDefaultHasher<T>() => (T value) => value.hashCode;
  static Sorter<T> _getDefaultSorter<T>() {
    switch (T) {
      case num:
        return _numSorter as Sorter<T>;
      case int:
        return _intSorter as Sorter<T>;
      case double:
        return _doubleSorter as Sorter<T>;
      case String:
        return _stringSorter as Sorter<T>;
    }
    return (left, right) => 0;
  }
}

int _numSorter(num left, num right) => left.compareTo(right);
int _intSorter(int left, int right) => left.compareTo(right);
int _doubleSorter(double left, double right) => left.compareTo(right);
int _stringSorter(String left, String right) => left.compareTo(right);
