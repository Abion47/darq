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