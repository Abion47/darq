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
typedef int Sorter<T>(T left, T right);

/// Takes an accumulate and a value of type `T`, then aggregates the value
/// into the accumulate and returns the result.
typedef T Aggregator<T>(T accumulate, T value);

/// Takes an integer that represents an index and then returns a value of type `T`
/// based on that index.
typedef T Generator<T>(int index);

/// Takes an element of type `TSource` and casts it to type `TResult`, returning
/// the result of the cast.
typedef TResult CastTransformer<TSource, TResult>(TSource element);

/// Takes an element of type `TSource` and transforms it into an [Iterable] of
/// type <TResult>, returning the result of the transformation.
typedef Iterable<TResult> ManySelector<TSource, TResult>(TSource element);

/// Takes a key of type `TKey` and a group of type `TSource` and maps them to a
/// value of type `TResult`, returning the result of the mapping. (The group will
/// typically be an instance of `IGrouping`.)
typedef TResult GroupSelector<TKey, TSource, TResult>(TKey key, TSource group);

/// Takes an element of type `TFirst` and an element of type `TSecond` and maps
/// them into a value of type `TResult`, returning the value.
typedef TResult ZipSelector<TFirst, TSecond, TResult>(
    TFirst first, TSecond second);

/// Takes an key of type `TKey` and a value of type `TValue` and maps
/// them into a value of type `TResult`, returning the value.
typedef TResult LookupSelector<TKey, TValue, TResult>(TKey key, TValue value);
