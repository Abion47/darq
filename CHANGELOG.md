## [0.2.0]

* The naming convention of the enumerable methods has been changed so that they are suffixed by the letter "e" (such as `selectE`, `joinE`, `whereE`). This is an attempt at a compromise between keeping the names of the methods consistent with their .NET origins while avoiding conflicts with existing `Iterable` methods.
* Added two new factory methods to `Enumerable`: `fromString` and `generator`. `fromString` converts a `String` into an `Enumerable` that iterates over each individual character, while `generator` allows an iterable to be created of the specified length using a given generator function.
* `countIfE` has been merged with `countE` so that `countE` now has a `Condition` as an optional parameter. If the `Condition` is provided, the behavior is identical to `countIfE`, and if not, the behavior is identical to the original `countE`.
* Fixed an issue where several of the enumerable methods weren't asserting on required parameters.

## [0.1.2]

* Addressing pub description warnings.

## [0.1.1]

* Addressing pub formatting warnings and issues.

## [0.1.0]

* Initial release.