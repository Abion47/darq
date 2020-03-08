## [0.5.0]

* Added a ton more extension methods, effectively quadrupling the number of methods added to `Iterable` (from 40 up to 160). Many of these methods were ported from the MoreLINQ library and modified to be more idiomatic to Dart.
* New methods:
  * `aggregateRight`
  * `aggregateRightSelect`
  * `aggregateSelect`
  * `appendAll`
  * `assertAll`
  * `assertAny`
  * `assertCount`
  * `atLeast`
  * `atMost`
  * `awaitAll`
  * `awaitAny`
  * `batch`
  * `batchSelect`
  * `between`
  * `cartesian`
  * `cartesianSelect`
  * `compareCount`
  * `concatAll`
  * `consume`
  * `countBy`
  * `defaultRangeIfEmpty`
  * `endsWith`
  * `exclude`
  * `excludeAt`
  * `excludeRange`
  * `fillBackward`
  * `fillForward`
  * `fillMissing`
  * `flatten`
  * `index`
  * `insert`
  * `insertAll`
  * `insertOrAppend`
  * `interleave`
  * `interleaveAll`
  * `lag`
  * `lagSelect`
  * `lead`
  * `leadSelect`
  * `memoize`
  * `move`
  * `nonNull`
  * `padEnd`
  * `padStart`
  * `pairwise`
  * `partition`
  * `permutations`
  * `prependAll`
  * `preScan`
  * `randomSubset`
  * `repeat`
  * `scan`
  * `skipLast`
  * `split`
  * `startsWith`
  * `subsets`
  * `takeEvery`
  * `takeLast`
  * `toHashMap`
  * `toLinkedHashMap`
  * `toSplayTreeMap`
  * `toStream`
* Added "try" variants of several methods which will return `null` or a default value upon a failed iteration rather than throwing an error.
  * `tryAggregate`
  * `tryAggregateRight`
  * `tryInsert`
  * `tryInsertAll`
  * `trySingleOrDefault`
  * `trySingleWhereOrDefault`
* Added "X" variants of several methods with more parameters to perform the same operation multiple times. (The "X" ranges from 2 to 9, representing the number of parameters in the method.)
  * `appendX`
  * `cartesianX`
  * `cartesianSelectX`
  * `concatX`
  * `insertX`
  * `insertOrAppendX`
  * `ofTypeX`
  * `prependX`
  * `tryInsertX`
* Breaking changes:
  * `aggregate`
    * Returns the same type as the source iterable. (Old functionality moved to `aggregateSelect`.)
  * `segment`
    * Renamed to `batch`

## [0.4.0+1]

* Fixing a bug in the documentation

## [0.4.0]

* `Enumerable` and all related subclasses have been removed. The package has changed over to using static extension methods on `Iterable`.
  * Related, the trailing "E" in method names as well as the utility factory `E` have been removed.
* `Enumerable` factory constructors have been converted into standalone factory classes (if not made redundant by existing `Iterable` constructors).
  * `Enumerable.empty` -> `Iterable.empty`
  * `Enumerable.from` -> _redundant_
  * `Enumerable.generate` -> `Iterable.generate`
  * `Enumerable.repeat` -> `RepeatIterator`
* A new factory class has been created: `RangeIterator`
  * Generates an iterable whose elements represent a range of integral values.
* Some methods have been renamed so as to not conflict with existing `Iterable` methods of the same name.
  * `join` -> `joinMap`
* Some methods have had functionality tweaked so as to maintain a separate identity from existing `Iterable` methods.
  * `select`: Selector argument now requires `(T element, int index)` as the parameters.
  * `selectMany`: Selector argument now requires `(T element, int index)` as the parameters.
* Some methods have been removed as existing methods in `Iterable` make them fully redundant.
  * `cast`
  * `elementAt`
  * `first`
  * `last`
  * `single`
  * `take`
  * `takeWhile`
  * `skip`
  * `skipWhile`
  * `toList`
  * `toSet`
  * `where`
* A new method has been added: `segment`
  * Groups the iterable into segments of an indicated size. Can optionally include any partial chunks at the end of the iterable.
* Extension getters have also been added to `String` to facilitate easy conversion to `Iterable<String>`.
  * `iterable`: Returns an iterable of the characters in the string.
  * `iterableRunes`: Returns an iterable of the characters in the string while respecting rune boundaries.

## [0.3.1]

* Typedefs have been converted from a shorthand form to the full form. This should help with some type inference issues.  

## [0.3.0]

* Unit tests have been added to ensure `Iterable` built-in functions behave as expected.
* Default reducers for methods where a comparator is optional (such as `aggregatorE`, `sumE`, and `orderByE`) have been extended to also support `Duration` and `BigInt`.
* Custom error types have been overhauled to utilize default Dart error types:
  * `UnexpectedStateError`, `KeyExistsError`, and `IntegerOverflowError` now extend `StateError` instead of `Error`.
  * `ConversionError` now extends `CastError` instead of `Error`.
  * `IncompatibleTypeError` now extends `UnsupportedError` instead of `Error`.
  * `NullEnumerableError`, `EmptyEnumerableError`, and `ElementNotFoundError` have been merged into `EnumerableError` which extends `StateError`.
  * `OperationError` has been removed. Code that threw `OperationError` now throws `StateError` with a descriptive message.
* Added subtype support for `ValueEnumerable` for specialized behavior when the source `Iterable` supports various actions. (Currently the only specialized subtype is `ListIterator` which enables short-circuiting for `countE` and `elementAtE` methods to call the list's `length` property and indexer, respectively.)
* Changed `countE` to call the underlying iterable's `length` property when `condition` is not specified. This should enable O(1) length calculations for default Dart collections that internally implement `EfficientLengthIterable`.
* Changed `EqualityComparer` to enable global setting of default comparers of new types. For example, for a custom type `Foo`, the static method `EqualityComparer.addDefaultEqualityComparer<Foo>(comparer)` will set the global default comparer for `Foo` to the passed `comparer` values. Following this call, all calls to LINQ methods that take an optional `EqualityComparer<Foo>` will default to using the previously registered comparer when a `comparer` is not specified.

Known Issues:

* `joinE` and `groupJoinE` have a problem with the type inference of the parameters, causing the types to default to `dynamic`. When calling these methods while specifying an `EqualityComparer`, it may be necessary to explicitly state the type parameters as well as the types of parameters in any closure functions to get type inference to work properly.

## [0.2.0]

* The naming convention of the enumerable methods has been changed so that they are suffixed by the letter "e" (such as `selectE`, `joinE`, `whereE`). This is an attempt at a compromise between keeping the names of the methods consistent with their .NET origins while avoiding conflicts with existing `Iterable` methods.
* Added two new factory methods to `Enumerable`: `fromString` and `generator`. `fromString` converts a `String` into an `Enumerable` that iterates over each individual character, while `generator` allows an iterable to be created of the specified length using a given generator function.
* `countIfE` has been merged with `countE` so that `countE` now has a `Condition` as an optional parameter. If the `Condition` is provided, the behavior is identical to `countIfE`, and if not, the behavior is identical to the original `countE`.
* Fixed an issue where several of the enumerable methods were not asserting on required parameters.

## [0.1.2]

* Addressing pub description warnings.

## [0.1.1]

* Addressing pub formatting warnings and issues.

## [0.1.0]

* Initial release.