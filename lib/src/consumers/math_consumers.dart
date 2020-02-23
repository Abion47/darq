import 'dart:collection';

import '../iterables/ordered_extensions.dart';

extension MathConsumerExtensions<T> on Iterable<T> {
  /// Aggregates the iterable into a single value.
  ///
  /// Aggregates the source iterable by applying the [aggregator] function to
  /// each value in the collection in the order they appear. The result is a
  /// single value that is the result of the aggregation.
  ///
  /// The [initialValue] parameter can be optionally applied, otherwise it
  /// defaults to a predefined value for primitive types and `null` for
  /// everything else.
  ///
  /// The [aggregator] function offers two parameters - the `accumulator` and
  /// the `value`. In each iteration, the `accumulator` represents the running
  /// result of the aggregation and the `value` represents the current element
  /// to process. The function should return what the next value of the
  /// aggregation should be, and that value will become the `accumulator` on the
  /// next iteration. Once the aggregation is complete, the last value to be
  /// returned is considered the result of the aggregation process.
  ///
  /// When the type of the iterable is one of the below types, the [aggregator]
  /// function can be omitted. In this case, the function defaults to predefined
  /// aggregator functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the sum of all elements.
  /// The initial value is set to the zero equivalent of the type.
  /// - `String` types return all the elements concatenated into a single
  /// string. The initial value is an empty string.
  ///
  /// If the iterable type is not one of these types, the [aggregator] function
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3, 4];
  ///       final result = list.aggregate(0, (a, b) => a + b);
  ///
  ///       // Result: 10
  ///     }
  ///

  TResult aggregate<TResult>(
    TResult initialValue,
    TResult Function(TResult, T) aggregator,
  ) {
    final iterator = this.iterator;
    var result = initialValue;

    while (iterator.moveNext()) {
      result = aggregator(result, iterator.current);
    }

    return result;
  }

  /// Aggregates the iterable into a single value in a right-associative manner.
  ///
  /// Aggregates the source iterable by applying the [aggregator] function to
  /// each value in the collection in the order they appear in reverse order. The
  /// result is a single value that is the result of the aggregation.
  ///
  /// The [initialValue] parameter can be optionally applied, otherwise it
  /// defaults to a predefined value for primitive types and `null` for
  /// everything else.
  ///
  /// The [aggregator] function offers two parameters - the `accumulator` and
  /// the `value`. In each iteration, the `accumulator` represents the running
  /// result of the aggregation and the `value` represents the current element
  /// to process. The function should return what the next value of the
  /// aggregation should be, and that value will become the `accumulator` on the
  /// next iteration. Once the aggregation is complete, the last value to be
  /// returned is considered the result of the aggregation process.
  ///
  /// When the type of the iterable is one of the below types, the [aggregator]
  /// function can be omitted. In this case, the function defaults to predefined
  /// aggregator functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the sum of all elements.
  /// The initial value is set to the zero equivalent of the type.
  /// - `String` types return all the elements concatenated into a single
  /// string. The initial value is an empty string.
  ///
  /// If the iterable type is not one of these types, the [aggregator] function
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = ['a', 'b', 'c'];
  ///       final result = list.aggregate('d', (prev, elem) => '($elem, $prev)');
  ///
  ///       // Result: (a, (b, (c, d)))
  ///     }
  ///

  TResult aggregateRight<TResult>(
    TResult initialValue,
    TResult Function(TResult, T) aggregator,
  ) =>
      reverse().aggregate(initialValue, aggregator);

  /// Calculates the average of all numerical values in the iterable.
  ///
  /// Applies an averaging function to all values in the iterable. If the type
  /// of the iterable is a numerical type, the function will be the typical numerical
  /// averaging function. Otherwise, the function will use the [selector] averaging
  /// function supplied.
  ///
  /// If the type of the iterator is a numerical type and the [selector] function
  /// isn't supplied, an [ArgumentError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 3, 5, 7, 9];
  ///       final result = list.average();
  ///
  ///       // Result: 5.0
  ///     }
  ///

  double average([num Function(T) selector]) {
    if (selector == null) {
      if (T == num) {
        selector = (T n) => n as num;
      } else if (T == int) {
        selector = (T n) => n as int;
      } else if (T == double) {
        selector = (T n) => n as double;
      }
    }

    if (isEmpty) {
      throw StateError('Iterator must not be empty.');
    }

    if (selector == null) {
      throw StateError(
          'If T isn\'t a subtype of num, selector must not be null.');
    }

    var total = 0.0;
    var count = 0;

    for (var n in this) {
      total += selector(n);
      count++;
    }

    return total / count;
  }

  /// Returns the number of elements in the iterable.
  ///
  /// Optionally, a [condition] can be specified. If so, the total count
  /// will be the number of elements for which the [condition] function
  /// returned `true`.
  ///
  /// If the [condition] parameter is omitted and the underlying collection extends
  /// or implements [EfficientLengthIterable], the [count] method will call the
  /// `length` property of the iterable as an O(1) operation. Otherwise, the
  /// [count] function will iterate over every element in the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final resultA = list.count();
  ///       final resultB = list.count((x) => x.isEven);
  ///
  ///       // ResultA: 4
  ///       // ResultB: 2
  ///     }
  ///

  ///
  int count([bool Function(T) condition]) {
    if (condition == null) return length;

    var count = 0;
    for (var v in this) {
      if (condition(v)) {
        count++;
      }
    }

    return count;
  }

  /// Applies [keySelector] to every element in this iterable and returns an iterable
  /// containing each resulting key and the number of times that key appears in this
  /// iterable.
  ///
  /// The order of the resulting iterable is not guaranteed to be any particular order.
  Iterable<MapEntry<TKey, int>> countBy<TKey>(
    TKey Function(T) keySelector,
  ) {
    final countMap = HashMap<TKey, int>();
    for (var o in this) {
      final key = keySelector(o);
      countMap.putIfAbsent(key, () => 0);
      countMap[key]++;
    }
    return countMap.entries;
  }

  /// Returns the maximum value in the iterable.
  ///
  /// Iterates over the iterable and applies the [comparer] to each element
  /// in order to find the maximum value. Once iteration is complete, [max]
  /// will return the largest element found.
  ///
  /// When the type of the iterable is one of the below types, the
  /// [comparer] can be omitted. In this case, the function defaults to
  /// predefined maximum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the maximum of all elements
  /// as defined by the `max` function in `dart:math`.
  ///
  /// - `String` types return the alphabetic maximum of all elements.
  ///
  /// If the iterable type is not one of these types, the [EqualityComparer]
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// If the iterable is empty, a [StateError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.max();
  ///
  ///       // Result: 3
  ///     }
  ///

  ///
  T max([int Function(T, T) comparer]) {
    if (comparer == null) {
      if (T == num) {
        comparer = (T a, T b) => (a as num).compareTo(b as num);
      } else if (T == int) {
        comparer = (T a, T b) => (a as int).compareTo(b as int);
      } else if (T == double) {
        comparer = (T a, T b) => (a as double).compareTo(b as double);
      } else if (T == String) {
        comparer = (T a, T b) => (a as String).compareTo(b as String);
      }
    }

    if (isEmpty) {
      throw StateError('Iterable must not be empty.');
    }

    if (comparer == null) {
      throw ArgumentError('comparer must not be null.');
    }

    T max;
    for (var v in this) {
      if (max == null) {
        max = v;
      } else if (comparer(v, max) > 0) {
        max = v;
      }
    }

    return max;
  }

  /// Returns the minimum value in the iterable.
  ///
  /// Iterates over the iterable and applies the [comparer] to each element
  /// in order to find the minimum value. Once iteration is complete, [min]
  /// will return the smallest element found.
  ///
  /// When the type of the iterable is one of the below types, the
  /// [comparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the minimum of all elements
  /// as defined by the `min` function in `dart:math`.
  ///
  /// - `String` types return the alphabetic minimum of all elements.
  ///
  /// If the iterable type is not one of these types, the [comparer]
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// If the iterable is empty, a [StateError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.min();
  ///
  ///       // Result: 0
  ///     }
  ///

  ///
  T min([int Function(T, T) comparer]) {
    if (comparer == null) {
      if (T == num) {
        comparer = (T a, T b) => (a as num).compareTo(b as num);
      } else if (T == int) {
        comparer = (T a, T b) => (a as int).compareTo(b as int);
      } else if (T == double) {
        comparer = (T a, T b) => (a as double).compareTo(b as double);
      } else if (T == String) {
        comparer = (T a, T b) => (a as String).compareTo(b as String);
      }
    }

    if (isEmpty) {
      throw StateError('Iterable must not be empty.');
    }

    if (comparer == null) {
      throw ArgumentError('comparer must not be null');
    }

    T min;
    for (var v in this) {
      if (min == null) {
        min = v;
      } else if (comparer(v, min) < 0) {
        min = v;
      }
    }

    return min;
  }

  /// Calculates the sum of the elements in an iterable, optionally using
  /// [selector] to obtain the value to be summed.
  ///
  /// Iterates over the entire iterable, passing each element to the
  /// [selector] function and adding its return value to a running total. Once
  /// iteration is complete, the total is returned.
  ///
  /// The type of the returned total is dependent on the value returned by the
  /// [selector] function. If all values are `int`, the return value of [sum]
  /// will be `int`. If all values are `double`, the return value of [sum] will
  /// be `double`. If all values are `num` or there is a combination of `int`
  /// and `double`, the return value of [sum] will be `num`.
  ///
  /// When the type of the iterable is a numeric primitive (e.g. `int`,
  /// `double`, or `num`), the [selector] function can be omitted. If so,
  /// the elements themselves are added to the running total.
  ///
  /// If the type of the iterable is not a numeric primitive, the [selector]
  /// function must be provided. Otherwise, a [StateError] is thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = [1, 2, 3, 4];
  ///       final result = list.sum();
  ///
  ///       // Result: 10
  ///     }
  ///

  ///
  num sum([num Function(T) selector]) {
    if (selector == null) {
      if (T == num) {
        selector = (T n) => n as num;
      } else if (T == int) {
        selector = (T n) => n as int;
      } else if (T == double) {
        selector = (T n) => n as double;
      }
    }

    if (isEmpty) {
      throw StateError('Iterator must not be empty.');
    }

    if (selector == null) {
      throw StateError(
          'If T isn\'t a subtype of num, selector must not be null.');
    }

    var total = T == int ? 0 : 0.0;

    for (var n in this) {
      total += selector(n);
    }

    return total;
  }
}
