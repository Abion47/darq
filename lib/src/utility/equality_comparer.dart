/// Takes two elements of type `T` and checks them for equality, returning `true`
/// if the elements are equal and `false` otherwise.
typedef Comparer<T> = bool Function(T left, T right);

/// Takes an element of type `T` and computes its hash code, returning the code's
/// integer value.
typedef Hasher<T> = int Function(T value);

/// Takes two values of type `T` and computes their sort order, represented by
/// a returned integer value.
///
/// The rules of the comparison are as follows:
///
/// - If [left] is less than [right], a negative number is returned.
/// - If [left] is greater than [right], a positive number is returned.
/// - If [left] and [right] are equal, 0 is returned.
typedef Sorter<T> = int Function(T left, T right);

/// Used in various iteration methods for allowing user-defined comparisons
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
/// checking for strict equivalency by using the `==` operator. (With the exception of
/// `Iterable`, which will default to using `BooleanConsumerExceptions.sequenceEqual`.)
///
/// ```dart
/// (left, right) => left == right;
/// // For iterables
/// (left, right) => left.sequenceEqual(right);
/// ```
///
/// The [EqualityComparer.hash] field generates hash codes. An element is passed
/// to the function and the function returns an integer value that represents
/// the element's hash code. If omitted, the function will default to calling the
/// object's `hashCode` property:
///
/// ```dart
/// (value) => value.hashCode;
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
/// - `Duration` will default to using [Duration.compareTo]
/// - `BigInt` will default to using [BigInt.compareTo]
/// - `DateTime` will default to using [DateTime.compareTo]
/// - All other types will default to a non-sorting function:
///
/// ```dart
/// (left, right) => return 0;
/// ```
class EqualityComparer<T> {
  final Comparer<T> compare;
  final Hasher<T> hash;
  final Sorter<T> sort;

  EqualityComparer({
    Comparer<T>? comparer,
    Hasher<T>? hasher,
    Sorter<T>? sorter,
  })  : compare = comparer ?? _getDefaultComparer<T>(),
        hash = hasher ?? _getDefaultHasher<T>(),
        sort = sorter ?? _getDefaultSorter<T>();

  static Comparer<T> _getDefaultComparer<T>() =>
      (T left, T right) => left == right;
  static Hasher<T> _getDefaultHasher<T>() => (T value) => value.hashCode;
  static Sorter<T> _getDefaultSorter<T>() => (left, right) => 0;

  /// Returns an [EqualityComparer] where the [sorter] and optionally [comparer] methods
  /// are set to call the [Comparable.compareTo] method of the provided type.
  /// The [hasher] method is set to the default hasher behavior of calling
  /// [Object.hashCode].
  ///
  /// If [useEquals] is true, [comparer] will use the default comparer behavior
  /// `(a, b) => a == b`. Otherwise, it will use [Comparable.compareTo] to
  /// determine equality, e.g. `(a, b) => a.compareTo(b) == 0`.
  static EqualityComparer<T> of<T extends Comparable<T>>(
      {bool useEquals = false}) {
    return EqualityComparer<T>(
      comparer: useEquals
          ? _getDefaultComparer<T>()
          : (T left, T right) => left.compareTo(right) == 0,
      sorter: (T left, T right) => left.compareTo(right),
      hasher: _getDefaultHasher<T>(),
    );
  }

  /// Returns the default [EqualityComparer] that has been registered for type
  /// `T`.
  ///
  /// The returned [EqualityComparer] will be the type registered to `T` for use
  /// as the comparer when the `comparer` parameter in various LINQ methods is
  /// omitted. The [EqualityComparer] will be one of the built-in default comparers
  /// (for [dynamic], [num], [int], [double], [String], [Duration], [DateTime], or [BigInt])
  /// or will be a comparer that has been registered via a call to
  /// [EqualityComparer.registerEqualityComparer].
  ///
  /// If no registered comparer can be found, this method returns a default `EqualityComparer`;
  static EqualityComparer<T> forType<T>() =>
      (_registeredEqualityComparers[T] ?? EqualityComparer<T>())
          as EqualityComparer<T>;

  /// Returns the default [EqualityComparer] that has been registered for type
  /// `T`.
  ///
  /// The returned [EqualityComparer] will be the type registered to `T` for use
  /// as the comparer when the `comparer` parameter in various LINQ methods is
  /// omitted. The [EqualityComparer] will be one of the built-in default comparers
  /// (for [dynamic], [num], [int], [double], [String], [Duration], or [BigInt])
  /// or will be a comparer that has been registered via a call to
  /// [EqualityComparer.registerEqualityComparer].
  ///
  /// If no registered comparer can be found, this method returns null.
  static EqualityComparer<T>? tryForType<T>() {
    if (_registeredEqualityComparers.containsKey(T)) {
      return _registeredEqualityComparers[T] as EqualityComparer<T>;
    }
    return null;
  }

  static final Map<Type, EqualityComparer<dynamic>>
      _registeredEqualityComparers = {
    dynamic: EqualityComparer<dynamic>(),
    bool: EqualityComparer<bool>(
      comparer: (left, right) => left == right,
      hasher: (value) => value.hashCode,
      sorter: (left, right) => (left ? 1 : 0) - (right ? 1 : 0),
    ),
    num: EqualityComparer.of<num>(useEquals: true),
    int: EqualityComparer<int>(
      comparer: (left, right) => left == right,
      hasher: (value) => value.hashCode,
      sorter: (left, right) => left.compareTo(right),
    ),
    double: EqualityComparer<double>(
      comparer: (left, right) => left == right,
      hasher: (value) => value.hashCode,
      sorter: (left, right) => left.compareTo(right),
    ),
    String: EqualityComparer.of<String>(useEquals: true),
    BigInt: EqualityComparer.of<BigInt>(),
    Duration: EqualityComparer.of<Duration>(),
    DateTime: EqualityComparer.of<DateTime>(),
  };

  /// Registers an [EqualityComparer] object as the default comparer for type `T`,
  /// returning a `bool` stating if a comparer already exists.
  ///
  /// If [overwrite] is `true`, the comparer will replace any existing comparer
  /// registered under `T` with the given one. If [overwrite] is `false` and a
  /// comparer for `T` is already registered, the new comparer is ignored. ([overwrite]
  /// defaults to `false`.)
  ///
  /// In either case, this method returns `true` if a comparer is already registered
  /// under type `T`, and `false` otherwise.
  static bool registerEqualityComparer<T>(EqualityComparer<T> comparer,
      {bool overwrite = false}) {
    var typeExists = _registeredEqualityComparers.containsKey(T);
    if (!typeExists || overwrite) _registeredEqualityComparers[T] = comparer;
    return typeExists;
  }

  /// Unregisters an [EqualityComparer] object as the default comparer for type `T`,
  /// returning the comparer object that was removed.
  ///
  /// If no comparer is registered for type `T`, the returned value is `null`.
  ///
  /// Following a call to this method, LINQ methods that attempt to call
  /// [EqualityComparer.forType] for the type `T` will instead get the default
  /// comparer until a comparer for `T` is provided again with a call to
  /// [EqualityComparer.registerEqualityComparer].
  static EqualityComparer<T> unregisterEqualityComparer<T>() {
    return _registeredEqualityComparers.remove(T) as EqualityComparer<T>;
  }
}
