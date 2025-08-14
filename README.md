[![pub package](https://img.shields.io/pub/v/darq.svg)](https://pub.dartlang.org/packages/darq)
[![github stars](https://img.shields.io/github/stars/abion47/darq.svg?style=flat&logo=github&colorB=deeppink&label=stars)](https://github.com/abion47/darq)
[![license MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://github.com/abion47/darq/workflows/Dart/badge.svg)](https://github.com/abion47/darq/actions)
[![Code Coverage](https://codecov.io/gh/abion47/darq/branch/master/graph/badge.svg)](https://codecov.io/gh/abion47/darq)

A port of .NET's LINQ IEnumerable functions to Dart. This package extends the native `Iterable` type with all of the LINQ methods that do not exist in native Dart. Starting with version 0.5, this package also contains the extension methods from the [MoreLINQ](https://morelinq.github.io/) .NET library.

## API Reference

 - [Dart Docs](https://pub.dev/documentation/darq/latest/darq/darq-library.html)

## Usage

Because this library uses Dart 2.6's new extension methods, any `Iterable` has access to these methods as though they were native methods. This includes classes that extend from `Iterable`, such as `List` and `Set`.

In addition, this library adds several new types of `Iterable` classes to make some utility functions easier:

```dart
// Creates an iterable containing the numbers from 2 to 6: [2, 3, 4, 5, 6]
var rangeI = RangeIterable(2, 6, inclusive: true);

// Creates an iterable that contains 3 copies of the value 'abc': ['abc', 'abc', 'abc']
var repeatI = RepeatIterable('abc', 3);

// Creates an iterable from a string, iterating over its characters
// This is an extension getter property on String that returns an 
// iterable via `String.codeUnits.map((u) => String.fromCodeUnit(u))`.
// Results in ['a', 'b', 'c', 'd', 'e', 'f']
var stringI = 'abcdef'.iterable;

// Same as above but using `runes` instead of `codeUnits` to respect 
// rune boundaries and maintain surrogate pairs.
var stringIR = 'abcdef'.iterableRunes;
```

You can call any of 110+ new methods on it to modify or analyze it. For example, the native method `map` is expanded upon with `select`, which combines the element with the index at which the element is found within the iterable:

```dart
var list = [10, 20, 30];
var mappedList = list.select((i, index) => '$index-$i'); // ['1-10', '2-20', '3-30']
```

There are "OrDefault" variants on several common `iterator` value getter methods, such as `firstOrDefault`, `singleOrDefault`, and `defaultIfEmpty`. Instead of throwing an error, these methods will return a default value (or null if left unspecified) if the element(s) cannot be found:

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

And you can group elements together by common features using `groupBy`:

```dart
var list = [1, 2, 3, 4, 5, 6];
var groupedList = list.groupBy((i) => i / 3 == 0); // [[1, 2, 4, 5], [3, 6]]
```

Or bundle them into groups of a fixed length using `segment`:

```dart
var list = [1, 2, 3, 4, 5, 6];
var segmented = list.segment(2); // [[1, 2], [3, 4], [5, 6]]
```

You can even perform complex ordering functions using `orderBy` and `thenBy`:

```dart
var list = ['ab', 'a', 'c', 'aa', ''];
// Sort by string length followed by alphabetical order
var ordered = list.orderBy((c) => c.length)
                  .thenBy((c) => c);
// Result: ['', 'a', 'c', 'aa', 'ab']
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
**NEW in 2.0.0**

With record support added in Dart 3, A new method has been added called `deconstruct`. It's purpose is to easily unwrap iterables of records, resulting in separate iterables containing the corresponding fields of the internal records.

```dart
var johns = [
  ("John Doe", 26, "E145326"),
  ("John Wick", 58, "E645091"),
  ("John Teesonter", 15, "E997123"),
];
var (names, ages, ids) = johns.deconstruct();

print(names); // ["John Doe", "John Wick", "John Teesonter"]
print(ages);  // [26, 58, 15]
print(ids);   // ["E145326", "E645091", "E997123"]
```

This extension method is implemented on lists containing records with up to nine fields.

(Note: Due to apparent current language restrictions, records containing named fields are not supported.)

## Tuples

As a necessity for some operations, I needed a `Tuple` class, and as I was unsatisfied with the current offerings out there right now, I elected to create my own.

For the uninitiated, tuples are similar to lists in concept that they contain multiple values addressable by index. But where every element of a list must resolve to the same type (the type of the list), each element in a tuple can be its own specified type. This results in being able to contain, distribute, and access the items in a tuple in a type-safe way. You could, for example, use a `Tuple2<double, String>` to return two values from a function and be able to access both the `double` and the `String` values without needing to resort to fragile methods such as `dynamic` or runtime type casting. Another difference between lists and tuples is that tuples are inherently immutable, so they aren't susceptible to side effects stemming from mutation and can even benefit from being declared as constants.

This package exposes tuple classes from `Tuple0` up to `Tuple9`, depending on how many items the tuple contains. (Yes, I agree that `Tuple0` and `Tuple1` seem largely redundant, but I've seen them exist in the tuple libraries of many programming languages so it must serve some purpose or other, so I included them here all the same for completeness if nothing else.) Each tuple class includes the following features:

* Constant constructors allow for efficient use of known tuple values.
* Includes access to the item(s) by getter (`tuple.item2`) or by indexer(`tuple[2]`). (Note that access by indexer is not type-safe)
* Factory constructor `fromJson` and method `toJson` means tuples are seralization-ready. 
* Additional factory constructor `fromList` to generate a tuple from a list (automatically casting when specifying type parameters for the constructor).
* An `asType` method allows freely casting the tuple from any assortment of types to any other assortment of types (provided the items are compatible with those types).
  * Additionally, there is an `asDynamic` convenience method for casting a tuple to dynamic items.
* Although tuples themselves are immutable, a `copyWith` method allows easy generation of duplicate tuples, optionally specifying new values for specific items.
  * Additionally, a `copyWithout` method allows selective filtering of items from a tuple resulting in a lower-order tuple.
* A `mapActions` method allows you to iterate over each item with an exhaustive list of type-safe callbacks.
* Each tuple class extends `Iterable<dynamic>`, so it can be treated as a normal iterable (and thus combined with any darq extension method).
* As `==` and `hashCode` are both implemented, tuples can be directly compared for equality or used as keys for maps and other hash sets.
* (2.0.0) Can be converted to and from Dart 3 records.

## MoreLINQ Extension Methods

As of version 0.5, this package also contains the extension methods from the [MoreLINQ](https://morelinq.github.io/) .NET library. This more than triples the available number of extension methods over vanilla LINQ.

Some examples of the new methods from MoreLINQ include:

`index`:

```dart
var list = ['a', 'b', 'c'];
var indexedList = list.index();

// Iterable:
// [ [0, 'a'], [1, 'b'], [2, 'c'] ]
```

`assertAll`:

```dart
var list = [2, 4, 5];
list.assertAll((x) => x.isEven);

// Throws an assertion error
```

`awaitAll`:

```dart
var list = [
  Future.delayed(Duration(seconds: 1)),
  Future.delayed(Duration(seconds: 2)),
  Future.delayed(Duration(seconds: 3)),
];
await list.awaitAll();

// Waits for 3 seconds before continuing
```

`subsets`:

```dart
var list = [1, 2, 3];
var subsets = list.subsets();

// Iterable: 
// [ [], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3] ]
```

`interleave`:

```dart
var listA = [1, 3, 5];
var listB = [2, 4, 6];
var combined = listA.interleave(listB);

// Iterable:
// [1, 2, 3, 4, 5, 6]
```

`permutations`:

```dart
var list = [1, 2, 3];
var perms = list.permutations();

// Iterable:
// [ [1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1] ]
```

`split`:

```dart
var list = ['a', ' ', 'b', 'c', ' ', 'd'];
var split = list.split(' ');

// Iterable:
// [ ['a'], ['b', 'c'], ['d'] ]
```

## New Iterable Types

 - [RangeIterable](https://pub.dev/documentation/darq/latest/darq/RangeIterable-class.html)
 - [RepeatIterable](https://pub.dev/documentation/darq/latest/darq/RepeatIterable-class.html)

## String Extension Methods

 - [iterable](https://pub.dev/documentation/darq/latest/darq/DarqStringExtension/iterable.html)
 - [iterableRunes](https://pub.dev/documentation/darq/latest/darq/DarqStringExtension/iterableRunes.html)

 ## Map Extension Methods

 - [entryRecords](https://pub.dev/documentation/darq/latest/darq/DarqMapExtension/entryRecords.html)
 - [entryTuples](https://pub.dev/documentation/darq/latest/darq/DarqMapExtension/entryTuples.html)

## Iterable Extension Methods

 - [aggregate](https://pub.dev/documentation/darq/latest/darq/AggregateExtension/aggregate.html)
 - [aggregateRight](https://pub.dev/documentation/darq/latest/darq/AggregateRightExtension/aggregateRight.html)
 - [aggregateRightSelect](https://pub.dev/documentation/darq/latest/darq/AggregateRightSelectExtension/aggregateRightSelect.html)
 - [aggregateSelect](https://pub.dev/documentation/darq/latest/darq/AggregateSelectExtension/aggregateSelect.html)
 - [all](https://pub.dev/documentation/darq/latest/darq/AllExtension/all.html)
 - [append](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append.html) ([2](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append2.html), [3](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append3.html), [4](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append4.html), [5](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append5.html), [6](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append6.html), [7](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append7.html), [8](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append8.html), [9](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append9.html))
 - [appendAll](https://pub.dev/documentation/darq/latest/darq/AppendAllExtension/appendAll.html)
 - [assertAll](https://pub.dev/documentation/darq/latest/darq/AssertAllExtension/assertAll.html)
 - [assertAny](https://pub.dev/documentation/darq/latest/darq/AssertAnyExtension/assertAny.html)
 - [assertCount](https://pub.dev/documentation/darq/latest/darq/AssertCountExtension/assertCount.html)
 - [atLeast](https://pub.dev/documentation/darq/latest/darq/AtLeastExtension/atLeast.html)
 - [atMost](https://pub.dev/documentation/darq/latest/darq/AtMostExtension/atMost.html)
 - [average](https://pub.dev/documentation/darq/latest/darq/AverageExtension/average.html)
 - [awaitAll](https://pub.dev/documentation/darq/latest/darq/AwaitAllExtension/awaitAll.html)
 - [awaitAny](https://pub.dev/documentation/darq/latest/darq/AwaitAnyExtension/awaitAny.html)
 - [batch](https://pub.dev/documentation/darq/latest/darq/BatchExtension/batch.html)
 - [batchSelect](https://pub.dev/documentation/darq/latest/darq/BatchSelectExtension/batchSelect.html)
 - [between](https://pub.dev/documentation/darq/latest/darq/BetweenExtension/between.html)
 - [cartesian](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian.html) ([3](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian3.html), [4](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian4.html), [5](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian5.html), [6](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian6.html), [7](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian7.html), [8](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian8.html), [9](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian9.html))
 - [cartesianSelect](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect.html) ([3](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect3.html), [4](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect4.html), [5](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect5.html), [6](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect6.html), [7](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect7.html), [8](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect8.html), [9](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect9.html))
 - [compareCount](https://pub.dev/documentation/darq/latest/darq/CompareCountExtension/compareCount.html)
 - [concat](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat.html) ([2](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat2.html), [3](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat3.html), [4](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat4.html), [5](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat5.html), [6](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat6.html), [7](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat7.html), [8](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat8.html), [9](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat9.html))
 - [concatAll](https://pub.dev/documentation/darq/latest/darq/ConcatAllExtension/concatAll.html)
 - [consume](https://pub.dev/documentation/darq/latest/darq/ConsumeExtension/consume.html)
 - [countBy](https://pub.dev/documentation/darq/latest/darq/CountByExtension/countBy.html)
 - [deconstruct](https://pub.dev/documentation/darq/latest/darq/Deconstruct1Extension/deconstruct.html) ([2](https://pub.dev/documentation/darq/latest/darq/Deconstruct2Extension/deconstruct.html), [3](https://pub.dev/documentation/darq/latest/darq/Deconstruct3Extension/deconstruct.html), [4](https://pub.dev/documentation/darq/latest/darq/Deconstruct4Extension/deconstruct.html), [5](https://pub.dev/documentation/darq/latest/darq/Deconstruct5Extension/deconstruct.html), [6](https://pub.dev/documentation/darq/latest/darq/Deconstruct6Extension/deconstruct.html), [7](https://pub.dev/documentation/darq/latest/darq/Deconstruct7Extension/deconstruct.html), [8](https://pub.dev/documentation/darq/latest/darq/Deconstruct8Extension/deconstruct.html), [9](https://pub.dev/documentation/darq/latest/darq/Deconstruct9Extension/deconstruct.html))
 - [defaultIfEmpty](https://pub.dev/documentation/darq/latest/darq/DefaultIfEmptyExtension/defaultIfEmpty.html)
 - [defaultRangeIfEmpty](https://pub.dev/documentation/darq/latest/darq/DefaultRangeIfEmptyExtension/defaultRangeIfEmpty.html)
 - [distinct](https://pub.dev/documentation/darq/latest/darq/DistinctExtension/distinct.html)
 - [elementAtOrDefault](https://pub.dev/documentation/darq/latest/darq/ElementAtOrDefaultExtension/elementAtOrDefault.html)
 - [endsWith](https://pub.dev/documentation/darq/latest/darq/EndsWithExtension/endsWith.html)
 - [except](https://pub.dev/documentation/darq/latest/darq/ExceptExtension/except.html)
 - [exclude](https://pub.dev/documentation/darq/latest/darq/ExcludeExtension/exclude.html)
 - [excludeAt](https://pub.dev/documentation/darq/latest/darq/ExcludeAtExtension/excludeAt.html)
 - [excludeRange](https://pub.dev/documentation/darq/latest/darq/ExcludeRangeExtension/excludeRange.html)
 - [fillBackward](https://pub.dev/documentation/darq/latest/darq/FillBackwardExtension/fillBackward.html)
 - [fillForward](https://pub.dev/documentation/darq/latest/darq/FillForwardExtension/fillForward.html)
 - [fillMissing](https://pub.dev/documentation/darq/latest/darq/FillMissingExtension/fillMissing.html)
 - [firstOrDefault](https://pub.dev/documentation/darq/latest/darq/FirstOrDefaultExtension/firstOrDefault.html)
 - [firstWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/FirstWhereOrDefaultExtension/firstWhereOrDefault.html)
 - [flatten](https://pub.dev/documentation/darq/latest/darq/FlattenExtension/flatten.html)
 - [groupBy](https://pub.dev/documentation/darq/latest/darq/GroupByExtension/groupBy.html)
 - [groupByValue](https://pub.dev/documentation/darq/latest/darq/GroupByValueExtension/groupByValue.html)
 - [groupJoin](https://pub.dev/documentation/darq/latest/darq/GroupJoinExtension/groupJoin.html)
 - [groupSelect](https://pub.dev/documentation/darq/latest/darq/GroupSelectExtension/groupSelect.html)
 - [groupSelectValue](https://pub.dev/documentation/darq/latest/darq/GroupSelectValueExtension/groupSelectValue.html)
 - [index](https://pub.dev/documentation/darq/latest/darq/IndexExtension/index.html)
 - [insert](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert.html) ([2](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert2.html), [3](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert3.html), [4](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert4.html), [5](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert5.html), [6](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert6.html), [7](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert7.html), [8](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert8.html), [9](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert9.html))
 - [insertWhere](https://pub.dev/documentation/darq/latest/darq/InsertWhereExtension/insert_where.html)
 - [insertAll](https://pub.dev/documentation/darq/latest/darq/InsertAllExtension/insertAll.html)
 - [insertOrAppend](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend.html) ([2](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend2.html), [3](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend3.html), [4](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend4.html), [5](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend5.html), [6](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend6.html), [7](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend7.html), [8](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend8.html), [9](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend9.html))
 - [insertOrAppendWhere](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendWhereExtension/insert_or_append_where.html)
 - [insertOrAppendAll](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendAllExtension/insertOrAppendAll.html)
 - [interleave](https://pub.dev/documentation/darq/latest/darq/InterleaveExtension/interleave.html)
 - [interleaveAll](https://pub.dev/documentation/darq/latest/darq/InterleaveAllExtension/interleaveAll.html)
 - [interleaveValue](https://pub.dev/documentation/darq/latest/darq/InterleaveValueExtension/interleave_value.html)
 - [interleaveValueWhere](https://pub.dev/documentation/darq/latest/darq/InterleaveValueWhereExtension/interleave_value_where.html)
 - [intersect](https://pub.dev/documentation/darq/latest/darq/IntersectExtension/intersect.html)
 - [joinMap](https://pub.dev/documentation/darq/latest/darq/JoinMapExtension/joinMap.html)
 - [lag](https://pub.dev/documentation/darq/latest/darq/LagExtension/lag.html)
 - [lagSelect](https://pub.dev/documentation/darq/latest/darq/LagSelectExtension/lagSelect.html)
 - [lastOrDefault](https://pub.dev/documentation/darq/latest/darq/LastOrDefaultExtension/lastOrDefault.html)
 - [lastWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/LastWhereOrDefaultExtension/lastWhereOrDefault.html)
 - [lead](https://pub.dev/documentation/darq/latest/darq/LeadExtension/lead.html)
 - [leadSelect](https://pub.dev/documentation/darq/latest/darq/LeadSelectExtension/leadSelect.html)
 - [mathConsumers](https://pub.dev/documentation/darq/latest/darq/MathConsumersExtension/mathConsumers.html)
 - [max](https://pub.dev/documentation/darq/latest/darq/MaxExtension/max.html)
 - [memoize](https://pub.dev/documentation/darq/latest/darq/MemoizeExtension/memoize.html)
 - [min](https://pub.dev/documentation/darq/latest/darq/MinExtension/min.html)
 - [move](https://pub.dev/documentation/darq/latest/darq/MoveExtension/move.html)
 - [nonNull](https://pub.dev/documentation/darq/latest/darq/NonNullExtension/nonNull.html)
 - [ofType](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType.html) ([2](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType2.html), [3](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType3.html), [4](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType4.html), [5](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType5.html), [6](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType6.html), [7](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType7.html), [8](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType8.html), [9](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType9.html))
 - [orderBy](https://pub.dev/documentation/darq/latest/darq/OrderByExtension/orderBy.html)
 - [orderByDescending](https://pub.dev/documentation/darq/latest/darq/OrderByDescendingExtension/orderByDescending.html)
 - [padEnd](https://pub.dev/documentation/darq/latest/darq/PadEndExtension/padEnd.html)
 - [pairwise](https://pub.dev/documentation/darq/latest/darq/PairwiseExtension/pairwise.html)
 - [partition](https://pub.dev/documentation/darq/latest/darq/PartitionExtension/partition.html)
 - [permutations](https://pub.dev/documentation/darq/latest/darq/PermutationsExtension/permutations.html)
 - [prepend](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend.html) ([2](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend2.html), [3](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend3.html), [4](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend4.html), [5](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend5.html), [6](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend6.html), [7](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend7.html), [8](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend8.html), [9](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend9.html))
 - [prependAll](https://pub.dev/documentation/darq/latest/darq/PrependAllExtension/prependAll.html)
 - [preScan](https://pub.dev/documentation/darq/latest/darq/PreScanExtension/preScan.html)
 - [random](https://pub.dev/documentation/darq/latest/darq/RandomSubsetExtension/random.html)
 - [randomSubset](https://pub.dev/documentation/darq/latest/darq/RandomSubsetExtension/randomSubset.html)
 - [randomize](https://pub.dev/documentation/darq/latest/darq/RandomizeExtension/randomize.html)
 - [repeat](https://pub.dev/documentation/darq/latest/darq/RepeatExtension/repeat.html)
 - [replaceAll](https://pub.dev/documentation/darq/latest/darq/ReplaceAllExtension/replaceAll.html)
 - [replaceAt](https://pub.dev/documentation/darq/latest/darq/ReplaceAtExtension/replaceAt.html)
 - [replaceEvery](https://pub.dev/documentation/darq/latest/darq/ReplaceEveryExtension/replaceEvery.html)
 - [replaceFrom](https://pub.dev/documentation/darq/latest/darq/ReplaceFromExtension/replaceFrom.html)
 - [replaceRange](https://pub.dev/documentation/darq/latest/darq/ReplaceRangeExtension/replaceRange.html)
 - [replaceWhere](https://pub.dev/documentation/darq/latest/darq/ReplaceWhereExtension/replaceWhere.html)
 - [reverse](https://pub.dev/documentation/darq/latest/darq/ReverseExtension/reverse.html)
 - [scan](https://pub.dev/documentation/darq/latest/darq/ScanExtension/scan.html)
 - [select](https://pub.dev/documentation/darq/latest/darq/SelectExtension/select.html)
 - [selectMany](https://pub.dev/documentation/darq/latest/darq/SelectManyExtension/selectMany.html)
 - [sequenceEquals](https://pub.dev/documentation/darq/latest/darq/SequenceEqualsExtension/sequenceEquals.html)
 - [singleOrDefault](https://pub.dev/documentation/darq/latest/darq/SingleOrDefaultExtension/singleOrDefault.html)
 - [singleWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/SingleWhereOrDefaultExtension/singleWhereOrDefault.html)
 - [skipLast](https://pub.dev/documentation/darq/latest/darq/SkipLastExtension/skipLast.html)
 - [split](https://pub.dev/documentation/darq/latest/darq/SplitExtension/split.html)
 - [splitSequence](https://pub.dev/documentation/darq/latest/darq/SplitSequenceExtension/split_sequence.html)
 - [splitWhere](https://pub.dev/documentation/darq/latest/darq/SplitWhereExtension/split_where.html)
 - [startsWith](https://pub.dev/documentation/darq/latest/darq/StartsWithExtension/startsWith.html)
 - [subsets](https://pub.dev/documentation/darq/latest/darq/SubsetsExtension/subsets.html)
 - [sum](https://pub.dev/documentation/darq/latest/darq/SumExtension/sum.html)
 - [takeEvery](https://pub.dev/documentation/darq/latest/darq/TakeEveryExtension/takeEvery.html)
 - [takeLast](https://pub.dev/documentation/darq/latest/darq/TakeLastExtension/takeLast.html)
 - [thenBy](https://pub.dev/documentation/darq/latest/darq/ThenByExtension/thenBy.html)
 - [thenByDescending](https://pub.dev/documentation/darq/latest/darq/ThenByDescendingExtension/thenByDescending.html)
 - [toHashMap](https://pub.dev/documentation/darq/latest/darq/ToHashMapExtension/toHashMap.html)
 - [toLinkedHashMap](https://pub.dev/documentation/darq/latest/darq/ToLinkedHashMapExtension/toLinkedHashMap.html)
 - [toMap](https://pub.dev/documentation/darq/latest/darq/ToMapExtension/toMap.html)
 - [toSplayTreeMap](https://pub.dev/documentation/darq/latest/darq/ToSplayTreeMapExtension/toSplayTreeMap.html)
 - [toStream](https://pub.dev/documentation/darq/latest/darq/ToStreamExtension/toStream.html)
 - [tryAggregate](https://pub.dev/documentation/darq/latest/darq/TryAggregateExtension/tryAggregate.html)
 - [tryAggregateRight](https://pub.dev/documentation/darq/latest/darq/TryAggregateRightExtension/tryAggregateRight.html)
 - [tryInsert](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert.html) ([2](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert2.html), [3](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert3.html), [4](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert4.html), [5](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert5.html), [6](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert6.html), [7](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert7.html), [8](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert8.html), [9](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert9.html))
 - [tryInsertAll](https://pub.dev/documentation/darq/latest/darq/TryInsertAllExtension/tryInsertAll.html)
 - [trySingleOrDefault](https://pub.dev/documentation/darq/latest/darq/TrySingleOrDefaultExtension/trySingleOrDefault.html)
 - [trySingleWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/TrySingleWhereOrDefaultExtension/trySingleWhereOrDefault.html)
 - [union](https://pub.dev/documentation/darq/latest/darq/UnionExtension/union.html)
 - [zip](https://pub.dev/documentation/darq/latest/darq/ZipExtension/zip.html)