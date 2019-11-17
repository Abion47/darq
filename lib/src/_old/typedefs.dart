/// Takes an element and defines a condition, then returns `true` if the element
/// satisfies the condition and `false` otherwise.
typedef bool Condition<T>(T element);

/// Takes an element of type `TSource` and maps it to a value of type `TResult`.
typedef TResult Selector<TSource, TResult>(TSource element);

/// Takes two elements of type `T` and checks them for equality, returning `true`
/// if the elements are equal and `false` otherwise.
typedef bool Comparer<T>(T left, T right);

/// Takes an element of type `T` and computes its hash code, returning the code's
/// integer value.
typedef int Hasher<T>(T value);

/// Takes two values of type `T` and computes their sort order, represented by
/// a returned integer value.
///
/// The rules of the comparison are as follows:
///
/// - If [left] is less than [right], a negative number is returned.
/// - If [left] is greater than [right], a positive number is returned.
/// - If [left] and [right] are equal, 0 is returned.
typedef Sorter<T> = int Function(T left, T right);

/// Takes an accumulate and a value of type `T`, then aggregates the value
/// into the accumulate and returns the result.
typedef Aggregator<T> = T Function(T accumulate, T value);

/// Takes an integer that represents an index and then returns a value of type `T`
/// based on that index.
typedef Generator<T> = T Function(int index);

/// Takes an element of type `TSource` and casts it to type `TResult`, returning
/// the result of the cast.
typedef CastTransformer<TSource, TResult> = TResult Function(TSource element);

/// Takes an element of type `TSource` and transforms it into an [Iterable] of
/// type <TResult>, returning the result of the transformation.
typedef ManySelector<TSource, TResult> = Iterable<TResult> Function(TSource element);

/// Takes a key of type `TKey` and a group of type `TSource` and maps them to a
/// value of type `TResult`, returning the result of the mapping. (The group will
/// typically be an instance of `IGrouping`.)
typedef GroupSelector<TKey, TSource, TResult> = TResult Function(TKey key, TSource group);

/// Takes an element of type `TFirst` and an element of type `TSecond` and maps
/// them into a value of type `TResult`, returning the value.
typedef ZipSelector<TFirst, TSecond, TResult> = TResult Function(
    TFirst first, TSecond second);

/// Takes an key of type `TKey` and a value of type `TValue` and maps
/// them into a value of type `TResult`, returning the value.
typedef LookupSelector<TKey, TValue, TResult> = TResult Function(
    TKey key, TValue value);
