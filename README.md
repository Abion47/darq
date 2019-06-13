[![pub package](https://img.shields.io/pub/v/darq.svg)](https://pub.dartlang.org/packages/darq)

A port of .NET's LINQ IEnumerable functions to Dart. This library adds a powerful `Enumerable` collection type to Dart that greatly increases convenience when modifying a collection as well as performance when dealing with large collections and complex modifications.

## API Reference

 - [Dart Docs](https://pub.dev/documentation/darq/latest/darq/darq-library.html)

## Lazy Execution

The power of `Enumerable` is that it supports modification to an underlying collection using lazy execution. This means that the enumerable only stores the data necessary to perform the modification and does not actually perform the modification until the enumerable is iterated over. No data is cached either, so unless you actually iterate over the enumerable, creating one is virtually free from both a memory and performance standpoint.

What's more, when multiple enumerable modifications are chained together, the iteration is done through them all simultaneously. This greatly eases the overhead of performing complex modifications on large collection sets.

## Usage

An `Enumerable` can be created out of any Dart collection type that extends `Iterable`. There are two ways to do so:

```dart
var sourceList = [0, 1, 2, 3, 4];

// Factory method
var factoryEnum = Enumerable.from(sourceList);

// Convenience method
var convenientEnum = E(sourceList);
```

You can also generate an `Enumerable` without needing a pre-existing collection using one of several factory methods:

```dart
// Creates an Enumerable with no values
var emptyEnum = Enumerable.empty();

// Creates an Enumerable containing 5 integers starting with the number 2
var rangeEnum = Enumerable.range(2, 5);

// Creates an Enumerable that contains 6 copies of the value 'a string'
var repeatEnum = Enumerable.repeat('a string', 6);
```

Once you have an `Enumerable`, you can call any of over 50 different methods on it to modify or analyze it. For example, you can map to a new value with `Select`:

```dart
var myEnum = E([1, 2, 3);
var mappedEnum = myEnum.Select((i) => i * 2);
// Values: [2, 4, 6]
```

...filter the elements with `Where`:

```dart
var myEnum = E([1, 2, 3);
var filteredEnum = myEnum.Where((i) => i.isOdd);
// Values: [1, 3]
```

...get only unique values with `Distinct`:

```dart
var myEnum = E([1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 5, 5]);
var uniqueEnum = myEnum.Distinct();
// Values: [1, 2, 3, 4, 5]
```

...or even group elements together using `GroupBy`:

```dart
var myEnum = E([1, 2, 3, 4, 5, 6]);
var groupedEnum = myEnum.GroupBy((i) => i % 2);
// Values: [[1, 3, 5], [2, 4, 6]]
```

What's more, you can chain methods together, enabling virtually endless possibilities in a concise chain of method calls:

```dart
var myEnum = E([1, 2, 3, 4, 5, 6]);
var resultEnum = myEnum.Select((i) => i * 2)
                       .Where((i) => i > 4)
                       .Select((i) => i.toRadixString(16));
/// Values: ['6', '8', 'A', 'C']
```

To use the values, you can iterate over the `Enumerable` just like you would any other `Iterable` collection:

```dart
var myEnum = E([1, 2, 3);
for (var value in myEnum) {
    print(value);
}

// Output:
// 1
// 2
// 3
```

You can also easily convert the `Enumerable` back into a Dart collection type using `ToList`, `ToMap`, or `ToSet`:

```dart
var myEnum = E([1, 2, 3]);
var myList = myEnum.ToList();
// myList is a List<int> with the values of myEnum
```

## Full Function List

 - [eAggregate](https://pub.dev/documentation/darq/latest/darq/Enumerable/eAggregate.html)
 - [eAll](https://pub.dev/documentation/darq/latest/darq/Enumerable/eAll.html)
 - [eAny](https://pub.dev/documentation/darq/latest/darq/Enumerable/eAny.html)
 - [eAppend](https://pub.dev/documentation/darq/latest/darq/Enumerable/eAppend.html)
 - [eAverage](https://pub.dev/documentation/darq/latest/darq/Enumerable/eAverage.html)
 - [eCast](https://pub.dev/documentation/darq/latest/darq/Enumerable/eCast.html)
 - [eConcat](https://pub.dev/documentation/darq/latest/darq/Enumerable/eConcat.html)
 - [eContains](https://pub.dev/documentation/darq/latest/darq/Enumerable/eContains.html)
 - [eCount](https://pub.dev/documentation/darq/latest/darq/Enumerable/eCount.html)
 - [eDefaultIfEmpty](https://pub.dev/documentation/darq/latest/darq/Enumerable/eDefaultIfEmpty.html)
 - [eDistinct](https://pub.dev/documentation/darq/latest/darq/Enumerable/eDistinct.html)
 - [eElementAt](https://pub.dev/documentation/darq/latest/darq/Enumerable/eElementAt.html)
 - [eElementAtOrDefault](https://pub.dev/documentation/darq/latest/darq/Enumerable/eElementAtOrDefault.html)
 - [eExcept](https://pub.dev/documentation/darq/latest/darq/Enumerable/eExcept.html)
 - [eFirst](https://pub.dev/documentation/darq/latest/darq/Enumerable/eFirst.html)
 - [eFirstOrDefault](https://pub.dev/documentation/darq/latest/darq/Enumerable/eFirstOrDefault.html)
 - [eGroupBy](https://pub.dev/documentation/darq/latest/darq/Enumerable/eGroupBy.html)
 - [eGroupByValue](https://pub.dev/documentation/darq/latest/darq/Enumerable/eGroupByValue.html)
 - [eGroupJoin](https://pub.dev/documentation/darq/latest/darq/Enumerable/eGroupJoin.html)
 - [eGroupSelect](https://pub.dev/documentation/darq/latest/darq/Enumerable/eGroupSelect.html)
 - [eGroupSelectValue](https://pub.dev/documentation/darq/latest/darq/Enumerable/eGroupSelectValue.html)
 - [eIntersect](https://pub.dev/documentation/darq/latest/darq/Enumerable/eIntersect.html)
 - [eJoin](https://pub.dev/documentation/darq/latest/darq/Enumerable/eJoin.html)
 - [eLast](https://pub.dev/documentation/darq/latest/darq/Enumerable/eLast.html)
 - [eLastOrDefault](https://pub.dev/documentation/darq/latest/darq/Enumerable/eLastOrDefault.html)
 - [eMax](https://pub.dev/documentation/darq/latest/darq/Enumerable/eMax.html)
 - [eMin](https://pub.dev/documentation/darq/latest/darq/Enumerable/eMin.html)
 - [eOfType](https://pub.dev/documentation/darq/latest/darq/Enumerable/eOfType.html)
 - [eOrderBy](https://pub.dev/documentation/darq/latest/darq/Enumerable/eOrderBy.html)
 - [eOrderByDescending](https://pub.dev/documentation/darq/latest/darq/Enumerable/eOrderByDescending.html)
 - [ePrepend](https://pub.dev/documentation/darq/latest/darq/Enumerable/ePrepend.html)
 - [eReverse](https://pub.dev/documentation/darq/latest/darq/Enumerable/eReverse.html)
 - [eSelect](https://pub.dev/documentation/darq/latest/darq/Enumerable/eSelect.html)
 - [eSelectMany](https://pub.dev/documentation/darq/latest/darq/Enumerable/eSelectMany.html)
 - [eSequenceEqual](https://pub.dev/documentation/darq/latest/darq/Enumerable/eSequenceEqual.html)
 - [eSingle](https://pub.dev/documentation/darq/latest/darq/Enumerable/eSingle.html)
 - [eSingleOrDefault](https://pub.dev/documentation/darq/latest/darq/Enumerable/eSingleOrDefault.html)
 - [eSkip](https://pub.dev/documentation/darq/latest/darq/Enumerable/eSkip.html)
 - [eSkipWhile](https://pub.dev/documentation/darq/latest/darq/Enumerable/eSkipWhile.html)
 - [eSum](https://pub.dev/documentation/darq/latest/darq/Enumerable/eSum.html)
 - [eTake](https://pub.dev/documentation/darq/latest/darq/Enumerable/eTake.html)
 - [eTakeWhile](https://pub.dev/documentation/darq/latest/darq/Enumerable/eTakeWhile.html)
 - [eThenBy](https://pub.dev/documentation/darq/latest/darq/Enumerable/eThenBy.html)
 - [eThenByDescending](https://pub.dev/documentation/darq/latest/darq/Enumerable/eThenByDescending.html)
 - [eToList](https://pub.dev/documentation/darq/latest/darq/Enumerable/eToList.html)
 - [eToMap](https://pub.dev/documentation/darq/latest/darq/Enumerable/eToMap.html)
 - [eToSet](https://pub.dev/documentation/darq/latest/darq/Enumerable/eToSet.html)
 - [eUnion](https://pub.dev/documentation/darq/latest/darq/Enumerable/eUnion.html)
 - [eWhere](https://pub.dev/documentation/darq/latest/darq/Enumerable/eWhere.html)
 - [eZip](https://pub.dev/documentation/darq/latest/darq/Enumerable/eZip.html)