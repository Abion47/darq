[![pub package](https://img.shields.io/pub/v/darq.svg)](https://pub.dartlang.org/packages/darq)

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

You can call any of 40 new methods on it to modify or analyze it. For example, the native method `map` is expanded upon with `select`, which combines the element with the index at which the element is found within the iterable:

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

## Full Function List

 - [aggregate](https://pub.dev/documentation/darq/latest/darq/AggregateExtension/aggregate.html)
 - [aggregateRight](https://pub.dev/documentation/darq/latest/darq/AggregateRightExtension/aggregateRight.html)
 - [aggregateRightSelect](https://pub.dev/documentation/darq/latest/darq/AggregateRightSelectExtension/aggregateRightSelect.html)
 - [aggregateSelect](https://pub.dev/documentation/darq/latest/darq/AggregateSelectExtension/aggregateSelect.html)
 - [all](https://pub.dev/documentation/darq/latest/darq/AllExtension/all.html)
 - [appendAll](https://pub.dev/documentation/darq/latest/darq/AppendAllExtension/appendAll.html)
 - [append](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append.html)
 - [append2](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append2.html)
 - [append3](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append3.html)
 - [append4](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append4.html)
 - [append5](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append5.html)
 - [append6](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append6.html)
 - [append7](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append7.html)
 - [append8](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append8.html)
 - [append9](https://pub.dev/documentation/darq/latest/darq/AppendExtension/append9.html)
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
 - [cartesian](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian.html)
 - [cartesian3](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian3.html)
 - [cartesian4](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian4.html)
 - [cartesian5](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian5.html)
 - [cartesian6](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian6.html)
 - [cartesian7](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian7.html)
 - [cartesian8](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian8.html)
 - [cartesian9](https://pub.dev/documentation/darq/latest/darq/CartesianExtension/cartesian9.html)
 - [cartesianSelect](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect.html)
 - [cartesianSelect3](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect3.html)
 - [cartesianSelect4](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect4.html)
 - [cartesianSelect5](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect5.html)
 - [cartesianSelect6](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect6.html)
 - [cartesianSelect7](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect7.html)
 - [cartesianSelect8](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect8.html)
 - [cartesianSelect9](https://pub.dev/documentation/darq/latest/darq/CartesianSelectExtension/cartesianSelect9.html)
 - [compareCount](https://pub.dev/documentation/darq/latest/darq/CompareCountExtension/compareCount.html)
 - [concatAll](https://pub.dev/documentation/darq/latest/darq/ConcatAllExtension/concatAll.html)
 - [concat](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat.html)
 - [concat2](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat2.html)
 - [concat3](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat3.html)
 - [concat4](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat4.html)
 - [concat5](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat5.html)
 - [concat6](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat6.html)
 - [concat7](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat7.html)
 - [concat8](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat8.html)
 - [concat9](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat9.html)
 - [consume](https://pub.dev/documentation/darq/latest/darq/ConsumeExtension/consume.html)
 - [countBy](https://pub.dev/documentation/darq/latest/darq/CountByExtension/countBy.html)
 - [defaultIfEmpty](https://pub.dev/documentation/darq/latest/darq/DefaultIfEmptyExtension/defaultIfEmpty.html)
 - [defaultRangeIfEmpty](https://pub.dev/documentation/darq/latest/darq/DefaultRangeIfEmptyExtension/defaultRangeIfEmpty.html)
 - [distinct](https://pub.dev/documentation/darq/latest/darq/DistinctExtension/distinct.html)
 - [elementAtOrDefault](https://pub.dev/documentation/darq/latest/darq/ElementAtOrDefaultExtension/elementAtOrDefault.html)
 - [endsWith](https://pub.dev/documentation/darq/latest/darq/EndsWithExtension/endsWith.html)
 - [except](https://pub.dev/documentation/darq/latest/darq/ExceptExtension/except.html)
 - [excludeAt](https://pub.dev/documentation/darq/latest/darq/ExcludeAtExtension/excludeAt.html)
 - [exclude](https://pub.dev/documentation/darq/latest/darq/ExcludeExtension/exclude.html)
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
 - [insertAll](https://pub.dev/documentation/darq/latest/darq/InsertAllExtension/insertAll.html)
 - [insert](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert.html)
 - [insert2](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert2.html)
 - [insert3](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert3.html)
 - [insert4](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert4.html)
 - [insert5](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert5.html)
 - [insert6](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert6.html)
 - [insert7](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert7.html)
 - [insert8](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert8.html)
 - [insert9](https://pub.dev/documentation/darq/latest/darq/InsertExtension/insert9.html)
 - [insertOrAppendAll](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendAllExtension/insertOrAppendAll.html)
 - [insertOrAppend](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend.html)
 - [insertOrAppend2](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend2.html)
 - [insertOrAppend3](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend3.html)
 - [insertOrAppend4](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend4.html)
 - [insertOrAppend5](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend5.html)
 - [insertOrAppend6](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend6.html)
 - [insertOrAppend7](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend7.html)
 - [insertOrAppend8](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend8.html)
 - [insertOrAppend9](https://pub.dev/documentation/darq/latest/darq/InsertOrAppendExtension/insertOrAppend9.html)
 - [interleaveAll](https://pub.dev/documentation/darq/latest/darq/InterleaveAllExtension/interleaveAll.html)
 - [interleave](https://pub.dev/documentation/darq/latest/darq/InterleaveExtension/interleave.html)
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
 - [ofType](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType.html)
 - [ofType2](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType2.html)
 - [ofType3](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType3.html)
 - [ofType4](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType4.html)
 - [ofType5](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType5.html)
 - [ofType6](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType6.html)
 - [ofType7](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType7.html)
 - [ofType8](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType8.html)
 - [ofType9](https://pub.dev/documentation/darq/latest/darq/OfTypeExtension/ofType9.html)
 - [orderByDescending](https://pub.dev/documentation/darq/latest/darq/OrderByDescendingExtension/orderByDescending.html)
 - [orderBy](https://pub.dev/documentation/darq/latest/darq/OrderByExtension/orderBy.html)
 - [orderedIterables](https://pub.dev/documentation/darq/latest/darq/OrderedIterablesExtension/orderedIterables.html)
 - [padEnd](https://pub.dev/documentation/darq/latest/darq/PadEndExtension/padEnd.html)
 - [pairwise](https://pub.dev/documentation/darq/latest/darq/PairwiseExtension/pairwise.html)
 - [partition](https://pub.dev/documentation/darq/latest/darq/PartitionExtension/partition.html)
 - [permutations](https://pub.dev/documentation/darq/latest/darq/PermutationsExtension/permutations.html)
 - [prependAll](https://pub.dev/documentation/darq/latest/darq/PrependAllExtension/prependAll.html)
 - [prepend](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend.html)
 - [prepend2](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend2.html)
 - [prepend3](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend3.html)
 - [prepend4](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend4.html)
 - [prepend5](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend5.html)
 - [prepend6](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend6.html)
 - [prepend7](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend7.html)
 - [prepend8](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend8.html)
 - [prepend9](https://pub.dev/documentation/darq/latest/darq/PrependExtension/prepend9.html)
 - [preScan](https://pub.dev/documentation/darq/latest/darq/PreScanExtension/preScan.html)
 - [randomSubset](https://pub.dev/documentation/darq/latest/darq/RandomSubsetExtension/randomSubset.html)
 - [repeat](https://pub.dev/documentation/darq/latest/darq/RepeatExtension/repeat.html)
 - [reverse](https://pub.dev/documentation/darq/latest/darq/ReverseExtension/reverse.html)
 - [scan](https://pub.dev/documentation/darq/latest/darq/ScanExtension/scan.html)
 - [select](https://pub.dev/documentation/darq/latest/darq/SelectExtension/select.html)
 - [selectMany](https://pub.dev/documentation/darq/latest/darq/SelectManyExtension/selectMany.html)
 - [sequenceEquals](https://pub.dev/documentation/darq/latest/darq/SequenceEqualsExtension/sequenceEquals.html)
 - [singleOrDefault](https://pub.dev/documentation/darq/latest/darq/SingleOrDefaultExtension/singleOrDefault.html)
 - [singleWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/SingleWhereOrDefaultExtension/singleWhereOrDefault.html)
 - [skipLast](https://pub.dev/documentation/darq/latest/darq/SkipLastExtension/skipLast.html)
 - [split](https://pub.dev/documentation/darq/latest/darq/SplitExtension/split.html)
 - [startsWith](https://pub.dev/documentation/darq/latest/darq/StartsWithExtension/startsWith.html)
 - [subsets](https://pub.dev/documentation/darq/latest/darq/SubsetsExtension/subsets.html)
 - [sum](https://pub.dev/documentation/darq/latest/darq/SumExtension/sum.html)
 - [takeEvery](https://pub.dev/documentation/darq/latest/darq/TakeEveryExtension/takeEvery.html)
 - [takeLast](https://pub.dev/documentation/darq/latest/darq/TakeLastExtension/takeLast.html)
 - [thenBy](https://pub.dev/documentation/darq/latest/darq/ThenByExtension/thenBy.html)
 - [toHashMap](https://pub.dev/documentation/darq/latest/darq/ToHashMapExtension/toHashMap.html)
 - [toLinkedHashMap](https://pub.dev/documentation/darq/latest/darq/ToLinkedHashMapExtension/toLinkedHashMap.html)
 - [toMap](https://pub.dev/documentation/darq/latest/darq/ToMapExtension/toMap.html)
 - [toSplayTreeMap](https://pub.dev/documentation/darq/latest/darq/ToSplayTreeMapExtension/toSplayTreeMap.html)
 - [toStream](https://pub.dev/documentation/darq/latest/darq/ToStreamExtension/toStream.html)
 - [tryAggregate](https://pub.dev/documentation/darq/latest/darq/TryAggregateExtension/tryAggregate.html)
 - [tryAggregateRight](https://pub.dev/documentation/darq/latest/darq/TryAggregateRightExtension/tryAggregateRight.html)
 - [tryInsertAll](https://pub.dev/documentation/darq/latest/darq/TryInsertAllExtension/tryInsertAll.html)
 - [tryInsert](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert.html)
 - [tryInsert2](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert2.html)
 - [tryInsert3](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert3.html)
 - [tryInsert4](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert4.html)
 - [tryInsert5](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert5.html)
 - [tryInsert6](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert6.html)
 - [tryInsert7](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert7.html)
 - [tryInsert8](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert8.html)
 - [tryInsert9](https://pub.dev/documentation/darq/latest/darq/TryInsertExtension/tryInsert9.html)
 - [trySingleOrDefault](https://pub.dev/documentation/darq/latest/darq/TrySingleOrDefaultExtension/trySingleOrDefault.html)
 - [trySingleWhereOrDefault](https://pub.dev/documentation/darq/latest/darq/TrySingleWhereOrDefaultExtension/trySingleWhereOrDefault.html)
 - [union](https://pub.dev/documentation/darq/latest/darq/UnionExtension/union.html)
 - [zip](https://pub.dev/documentation/darq/latest/darq/ZipExtension/zip.html)