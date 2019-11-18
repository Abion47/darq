[![pub package](https://img.shields.io/pub/v/darq.svg)](https://pub.dartlang.org/packages/darq)

A port of .NET's LINQ IEnumerable functions to Dart. This library extends the native `Iterable` type with all of the LINQ methods that do not exist in native Dart.

## API Reference

 - [Dart Docs](https://pub.dev/documentation/darq/latest/darq/darq-library.html)

## Usage

Because this library uses Dart 2.6's new extension methods, any `Iterable` has access to these methods as though they were native methods. This includes classes that extend from `Iterable`, such as `List` and `Set`.

In addition, this library adds several new types of `Iterable` classes to make some utility functions easier:

```dart
// Creates an iterable containing 5 integers starting with the number 2: [2, 3, 4, 5, 6]
var rangeI = RangeIterable(2, 5);

// Creates an iterable that contains 3 copies of the value 'abc': ['abc', 'abc', 'abc']
var repeatI = RepeatIterable('abc', 6);

// Creates an iterable from a string, iterating over its characters
var stringI = 'abcdef'.iterable;
```

You can call any of 39 new methods on it to modify or analyze it. For example, the native method `map` is expanded upon with `select`, which combines the element with the index the element is found within the iterable:

```dart
var list = [10, 20, 30];
var mappedList = list.select((i, index) => '$index-$i'); // ['1-10', '2-20', '3-30']
```

There are "orDefault" variants on several common `iterator` value getter methods, such as `firstOrDefault`, `singleOrDefault`, and `defaultIfEmpty`:

```dart
var list = <String>[];

var native = list.first; // Throws a StateError
var orDefault = list.firstOrDefault('abc'); // Returns 'abc'

var list2 = [1, 2, 3];
var importantValue = list2.where((i) => i >= 4)
                          .defaultIfEmpty(-1); // Returns [-1]
```

You can filter an iterable down to unique instances of elements with the `distinct` method:

```dart
var list = [1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 5, 5];
var uniqueList = myEnum.distinct(); // [1, 2, 3, 4, 5]
```

There are also set operations with the `except`, `intersect`, and `union` methods:

```dart
var listA = [1, 2, 3, 4];
var listB = [3, 4, 5, 6];

var exclusion = listA.except(listB);       // [1, 2]
var intersection = listA.intersect(listB); // [3, 4]
var union = listA.union(listB);            // [1, 2, 3, 4, 5, 6]
```

And you can group elements together using `groupBy`:

```dart
var list = [1, 2, 3, 4, 5, 6];
var groupedList = list.groupBy((i) => i % 2); // [[1, 3, 5], [2, 4, 6]]
```

Just like in native dart, every method returns a new `Iterable`, so you can chain methods together to make complex mapping, grouping, and filtering behavior:

```dart
var list = [3, 1, 6, 2, 3, 2, 4, 1];
var result = list.select((i, idx) => i * 2 + idx)     // [6, 3, 14, 8, 10, 10, 14, 9]
                 .distinct()                          // [6, 3, 14, 8, 10, 9]
                 .where((i) => i > 4)                 // [6, 14, 8, 10, 9]
                 .orderBy((i) => i)                   // [6, 8, 9, 10, 14]
                 .map((i) => i.toRadixString(16));    // [6, 8, 9, A, E]
```

## Full Function List

 - [aggregate](https://pub.dev/documentation/darq/latest/darq/IterableExtension/aggregate.html)
 - [all](https://pub.dev/documentation/darq/latest/darq/IterableExtension/all.html)
 - [append](https://pub.dev/documentation/darq/latest/darq/IterableExtension/append.html)
 - [average](https://pub.dev/documentation/darq/latest/darq/IterableExtension/average.html)
 - [concat](https://pub.dev/documentation/darq/latest/darq/IterableExtension/concat.html)
 - [count](https://pub.dev/documentation/darq/latest/darq/IterableExtension/count.html)
 - [defaultIfEmpty](https://pub.dev/documentation/darq/latest/darq/IterableExtension/defaultIfEmpty.html)
 - [distinct](https://pub.dev/documentation/darq/latest/darq/IterableExtension/distinct.html)
 - [elementAtOrDefault](https://pub.dev/documentation/darq/latest/darq/IterableExtension/elementAtOrDefault.html)
 - [except](https://pub.dev/documentation/darq/latest/darq/IterableExtension/except.html)
 - [firstWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/IterableExtension/firstWhereOrDefault.html)
 - [firstOrDefault](https://pub.dev/documentation/darq/latest/darq/IterableExtension/firstOrDefault.html)
 - [groupBy](https://pub.dev/documentation/darq/latest/darq/IterableExtension/groupBy.html)
 - [groupByValue](https://pub.dev/documentation/darq/latest/darq/IterableExtension/groupByValue.html)
 - [groupJoin](https://pub.dev/documentation/darq/latest/darq/IterableExtension/groupJoin.html)
 - [groupSelect](https://pub.dev/documentation/darq/latest/darq/IterableExtension/groupSelect.html)
 - [groupSelectValue](https://pub.dev/documentation/darq/latest/darq/IterableExtension/groupSelectValue.html)
 - [intersect](https://pub.dev/documentation/darq/latest/darq/IterableExtension/intersect.html)
 - [joinMap](https://pub.dev/documentation/darq/latest/darq/IterableExtension/joinMap.html)
 - [lastOrDefault](https://pub.dev/documentation/darq/latest/darq/IterableExtension/lastOrDefault.html)
 - [lastWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/IterableExtension/lastWhereOrDefault.html)
 - [max](https://pub.dev/documentation/darq/latest/darq/IterableExtension/max.html)
 - [min](https://pub.dev/documentation/darq/latest/darq/IterableExtension/min.html)
 - [ofType](https://pub.dev/documentation/darq/latest/darq/IterableExtension/ofType.html)
 - [orderBy](https://pub.dev/documentation/darq/latest/darq/IterableExtension/orderBy.html)
 - [orderByDescending](https://pub.dev/documentation/darq/latest/darq/IterableExtension/orderByDescending.html)
 - [prepend](https://pub.dev/documentation/darq/latest/darq/IterableExtension/prepend.html)
 - [reverse](https://pub.dev/documentation/darq/latest/darq/IterableExtension/reverse.html)
 - [select](https://pub.dev/documentation/darq/latest/darq/IterableExtension/select.html)
 - [selectMany](https://pub.dev/documentation/darq/latest/darq/IterableExtension/selectMany.html)
 - [sequenceEqual](https://pub.dev/documentation/darq/latest/darq/IterableExtension/sequenceEqual.html)
 - [singleOrDefault](https://pub.dev/documentation/darq/latest/darq/IterableExtension/singleOrDefault.html)
 - [singleWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/IterableExtension/singleWhereOrDefault.html)
 - [sum](https://pub.dev/documentation/darq/latest/darq/IterableExtension/sum.html)
 - [thenBy](https://pub.dev/documentation/darq/latest/darq/IterableExtension/thenBy.html)
 - [thenByDescending](https://pub.dev/documentation/darq/latest/darq/IterableExtension/thenByDescending.html)
 - [toMap](https://pub.dev/documentation/darq/latest/darq/IterableExtension/toMap.html)
 - [union](https://pub.dev/documentation/darq/latest/darq/IterableExtension/union.html)
 - [zip](https://pub.dev/documentation/darq/latest/darq/IterableExtension/zip.html)