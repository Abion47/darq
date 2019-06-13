## [0.2.0]

* The naming convention of the enumerable methods has been changed so that they are prefixed by the letter "e" (such as `eSelect`, `eJoin`, `eWhere`). This is an attemt at a compromise between keeping the names of the methods consistent with their .NET origins while avoiding conflicts with existing `Iterable` methods.
* `CountIf` has been merged with `Count` so that `Count` now has a `Condition` as an optional parameter. If the `Condition` is provided, the behavior is identical to `CountIf`, and if not, the behavior is identical to the original `Count`.
* Fixed an issue where several of the enumerable methods werent asserting on required parameters.

## [0.1.2]

* Addressing pub description warnings.

## [0.1.1]

* Addressing pub formatting warnings and issues.

## [0.1.0]

* Initial release.