import '../tuple.dart';
import 'insertion_extensions.dart';

extension SetIterableExtensions<T> on Iterable<T> {
  /// Generates the cartesian product of this iterable and [other].
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided [other] iterable. The resulting iterable will consist
  /// of an iterable of [Tuple2] with each combination of each element from this
  /// iterable and each element from [other].
  Iterable<Tuple2<T, T2>> cartesian<T2>(Iterable<T2> other) sync* {
    if (other == null) {
      ArgumentError.notNull('other');
    }

    for (var a in this) {
      for (var b in other) {
        yield Tuple2(a, b);
      }
    }
  }

  /// Generates the cartesian product of this iterable and two other iterables.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable of [Tuple3] with each combination of each element from this
  /// iterable and each element from each other iterable.
  Iterable<Tuple3<T, T2, T3>> cartesian3<T2, T3>(
    Iterable<T2> o2,
    Iterable<T3> o3,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          yield Tuple3(a, b, c);
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and three other iterables.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable of [Tuple4] with each combination of each element from this
  /// iterable and each element from each other iterable
  Iterable<Tuple4<T, T2, T3, T4>> cartesian4<T2, T3, T4>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            yield Tuple4(a, b, c, d);
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and four other iterables.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable of [Tuple5] with each combination of each element from this
  /// iterable and each element from each other iterable
  Iterable<Tuple5<T, T2, T3, T4, T5>> cartesian5<T2, T3, T4, T5>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              yield Tuple5(a, b, c, d, e);
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and five other iterables.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable of [Tuple6] with each combination of each element from this
  /// iterable and each element from each other iterable
  Iterable<Tuple6<T, T2, T3, T4, T5, T6>> cartesian6<T2, T3, T4, T5, T6>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    Iterable<T6> o6,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }
    if (o6 == null) {
      ArgumentError.notNull('o6');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              for (var f in o6) {
                yield Tuple6(a, b, c, d, e, f);
              }
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and six other iterables.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable of [Tuple7] with each combination of each element from this
  /// iterable and each element from each other iterable
  Iterable<Tuple7<T, T2, T3, T4, T5, T6, T7>>
      cartesian7<T2, T3, T4, T5, T6, T7>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    Iterable<T6> o6,
    Iterable<T7> o7,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }
    if (o6 == null) {
      ArgumentError.notNull('o6');
    }
    if (o7 == null) {
      ArgumentError.notNull('o7');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              for (var f in o6) {
                for (var g in o7) {
                  yield Tuple7(a, b, c, d, e, f, g);
                }
              }
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and seven other iterables.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable of [Tuple7] with each combination of each element from this
  /// iterable and each element from each other iterable
  Iterable<Tuple8<T, T2, T3, T4, T5, T6, T7, T8>>
      cartesian8<T2, T3, T4, T5, T6, T7, T8>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    Iterable<T6> o6,
    Iterable<T7> o7,
    Iterable<T8> o8,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }
    if (o6 == null) {
      ArgumentError.notNull('o6');
    }
    if (o7 == null) {
      ArgumentError.notNull('o7');
    }
    if (o8 == null) {
      ArgumentError.notNull('o8');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              for (var f in o6) {
                for (var g in o7) {
                  for (var h in o8) {
                    yield Tuple8(a, b, c, d, e, f, g, h);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and eight other iterables.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable of [Tuple7] with each combination of each element from this
  /// iterable and each element from each other iterable
  Iterable<Tuple9<T, T2, T3, T4, T5, T6, T7, T8, T9>>
      cartesian9<T2, T3, T4, T5, T6, T7, T8, T9>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    Iterable<T6> o6,
    Iterable<T7> o7,
    Iterable<T8> o8,
    Iterable<T9> o9,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }
    if (o6 == null) {
      ArgumentError.notNull('o6');
    }
    if (o7 == null) {
      ArgumentError.notNull('o7');
    }
    if (o8 == null) {
      ArgumentError.notNull('o8');
    }
    if (o9 == null) {
      ArgumentError.notNull('o9');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              for (var f in o6) {
                for (var g in o7) {
                  for (var h in o8) {
                    for (var i in o9) {
                      yield Tuple9(a, b, c, d, e, f, g, h, i);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and [other], returning an
  /// iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided [other] iterable. Each combination of element from this
  /// iterable and each element from [other] will be passed to [selector] to
  /// generate the result.
  Iterable<TResult> cartesianSelect<T2, TResult>(
    Iterable<T2> other,
    TResult Function(T, T2) selector,
  ) sync* {
    if (other == null) {
      ArgumentError.notNull('other');
    }

    for (var a in this) {
      for (var b in other) {
        yield selector(a, b);
      }
    }
  }

  /// Generates the cartesian product of this iterable and two other iterables,
  /// returning an iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable with each combination of each element from this
  /// iterable and each element from each other iterable after being passed through
  /// the [selector] function.
  Iterable<TResult> cartesianSelect3<T2, T3, TResult>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    TResult Function(T, T2, T3) selector,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          yield selector(a, b, c);
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and three other iterables,
  /// returning an iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable with each combination of each element from this
  /// iterable and each element from each other iterable after being passed through
  /// the [selector] function.
  Iterable<TResult> cartesianSelect4<T2, T3, T4, TResult>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    TResult Function(T, T2, T3, T4) selector,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            yield selector(a, b, c, d);
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and four other iterables,
  /// returning an iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable with each combination of each element from this
  /// iterable and each element from each other iterable after being passed through
  /// the [selector] function.
  Iterable<TResult> cartesianSelect5<T2, T3, T4, T5, TResult>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    TResult Function(T, T2, T3, T4, T5) selector,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              yield selector(a, b, c, d, e);
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and five other iterables,
  /// returning an iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable with each combination of each element from this
  /// iterable and each element from each other iterable after being passed through
  /// the [selector] function.
  Iterable<TResult> cartesianSelect6<T2, T3, T4, T5, T6, TResult>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    Iterable<T6> o6,
    TResult Function(T, T2, T3, T4, T5, T6) selector,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }
    if (o6 == null) {
      ArgumentError.notNull('o6');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              for (var f in o6) {
                yield selector(a, b, c, d, e, f);
              }
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and six other iterables,
  /// returning an iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable with each combination of each element from this
  /// iterable and each element from each other iterable after being passed through
  /// the [selector] function.
  Iterable<TResult> cartesianSelect7<T2, T3, T4, T5, T6, T7, TResult>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    Iterable<T6> o6,
    Iterable<T7> o7,
    TResult Function(T, T2, T3, T4, T5, T6, T7) selector,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }
    if (o6 == null) {
      ArgumentError.notNull('o6');
    }
    if (o7 == null) {
      ArgumentError.notNull('o7');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              for (var f in o6) {
                for (var g in o7) {
                  yield selector(a, b, c, d, e, f, g);
                }
              }
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and seven other iterables,
  /// returning an iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable with each combination of each element from this
  /// iterable and each element from each other iterable after being passed through
  /// the [selector] function.
  Iterable<TResult> cartesianSelect8<T2, T3, T4, T5, T6, T7, T8, TResult>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    Iterable<T6> o6,
    Iterable<T7> o7,
    Iterable<T8> o8,
    TResult Function(T, T2, T3, T4, T5, T6, T7, T8) selector,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }
    if (o6 == null) {
      ArgumentError.notNull('o6');
    }
    if (o7 == null) {
      ArgumentError.notNull('o7');
    }
    if (o8 == null) {
      ArgumentError.notNull('o8');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              for (var f in o6) {
                for (var g in o7) {
                  for (var h in o8) {
                    yield selector(a, b, c, d, e, f, g, h);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  /// Generates the cartesian product of this iterable and eight other iterables,
  /// returning an iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided iterables. The resulting iterable will consist
  /// of an iterable with each combination of each element from this
  /// iterable and each element from each other iterable after being passed through
  /// the [selector] function.
  Iterable<TResult> cartesianSelect9<T2, T3, T4, T5, T6, T7, T8, T9, TResult>(
    Iterable<T2> o2,
    Iterable<T3> o3,
    Iterable<T4> o4,
    Iterable<T5> o5,
    Iterable<T6> o6,
    Iterable<T7> o7,
    Iterable<T8> o8,
    Iterable<T9> o9,
    TResult Function(T, T2, T3, T4, T5, T6, T7, T8, T9) selector,
  ) sync* {
    if (o2 == null) {
      ArgumentError.notNull('o2');
    }
    if (o3 == null) {
      ArgumentError.notNull('o3');
    }
    if (o4 == null) {
      ArgumentError.notNull('o4');
    }
    if (o5 == null) {
      ArgumentError.notNull('o5');
    }
    if (o6 == null) {
      ArgumentError.notNull('o6');
    }
    if (o7 == null) {
      ArgumentError.notNull('o7');
    }
    if (o8 == null) {
      ArgumentError.notNull('o8');
    }
    if (o9 == null) {
      ArgumentError.notNull('o9');
    }

    for (var a in this) {
      for (var b in o2) {
        for (var c in o3) {
          for (var d in o4) {
            for (var e in o5) {
              for (var f in o6) {
                for (var g in o7) {
                  for (var h in o8) {
                    for (var i in o9) {
                      yield selector(a, b, c, d, e, f, g, h, i);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  /// Returns an iterable representing the distinct values of this iterable.
  ///
  /// After applying the [distinct] method to an iterable, the resulting
  /// iterable will consist of distinct values in the source iterable.
  ///
  /// Optionally, a [keySelector] can be supplied to handle comparisons. If
  /// one is provided, the [distinct] method will use the [comparer] property in
  /// order to determine equivalency. If omitted, [distinct] will resort to strict
  /// equivalency (i.e. checking `if (value == element)`).
  ///
  /// Each element will be the first element found in the source iterable,
  /// meaning elements with unique data that are deemed non-distinct by the
  /// [keySelector] will be dropped.
  ///
  /// If none of the elements in the iterable match any other element in the
  /// iterable, the iterable will be unchanged.\
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 0, 0, 1, 1, 2, 3, 3, 3];
  ///       final result = list.distinct();
  ///
  ///       // Result: [0, 1, 2, 3]
  ///     }
  Iterable<T> distinct<TKey>([TKey Function(T) keySelector]) sync* {
    keySelector ??= (T v) => v as TKey;
    final set = <TKey>{};

    for (var t in this) {
      if (set.add(keySelector(t))) yield t;
    }
  }

  /// Returns the set difference between the iterable and the given
  /// collection.
  ///
  /// After applying the [except] method to an iterable, the resulting
  /// iterable will consist of all the elements in the source iterable that
  /// are not present in the given [other] collection. This is equivalent to
  /// taking the set difference of the two sequences.
  ///
  /// Optionally, a [selector] can be supplied to handle comparisons. If
  /// one is provided, the [except] method will use the [selector] function in
  /// order to determine equivalency.  If omitted, [except] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// If none of the elements in the source iterable match any element in the
  /// given [other] collection, the iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = [1, 2, 3, 4];
  ///       final listB = [3, 4, 5, 6];
  ///       final result = listA.except(listB);
  ///
  ///       // Result: [1, 2]
  ///     }
  Iterable<T> except<TKey>(Iterable<T> other,
      [TKey Function(T) selector]) sync* {
    selector ??= (T v) => v as TKey;

    final set = Set<TKey>.from(other.map(selector));
    for (var v in this) {
      if (!set.contains(selector(v))) yield v;
    }
  }

  /// Returns the set intersection between the iterable and the given
  /// collection.
  ///
  /// After applying the [intersect] method to an iterable, the resulting
  /// iterable will consist of all the elements in the source iterable that
  /// are also present in the given [other] collection. This is equivalent to
  /// taking the set intersection of the two sequences.
  ///
  /// Optionally, a [selector] can be supplied to refine the comparison. If
  /// one is provided, the [intersect] method will use the [selector] function in
  /// order to determine equivalency.  If omitted, [intersect] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// If all of the elements in the source iterable match an element in the
  /// given [other] collection, the iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = [1, 2, 3, 4];
  ///       final listB = [3, 4, 5, 6];
  ///       final result = listA.intersect(listB);
  ///
  ///       // Result: [3, 4]
  ///     }
  Iterable<T> intersect<TKey>(Iterable<T> other,
      [TKey Function(T) selector]) sync* {
    selector ??= (T v) => v as TKey;

    final set = Set<TKey>.from(other.map(selector));
    for (var v in this) {
      if (set.contains(selector(v))) yield v;
    }
  }

  /// Returns an iterable that consists of iterables, where each iterable is
  /// a collection of all the permutations of the elements in this iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3];
  ///       final result = list.permutations();
  ///
  ///       // Result: [
  ///       //   [ 1, 2, 3],
  ///       //   [ 1, 3, 2],
  ///       //   [ 2, 1, 3],
  ///       //   [ 2, 3, 1],
  ///       //   [ 3, 1, 2],
  ///       //   [ 3, 2, 1],
  ///       // ]
  ///     }
  Iterable<Iterable<T>> permutations() {
    return _permutationsRecursive(this);
  }

  Iterable<Iterable<T>> _permutationsRecursive(Iterable<T> input) sync* {
    var index = 0;
    for (var o in input) {
      yield* _permutationsRecursive(input.excludeAt(index))
          .map((i) => i.prepend(o));
      index++;
    }
    // if (input.length <= 1) {
    //   yield input;
    //   return;
    // }

    // if (input.length == 2) {
    //   yield [input[0], input[1]];
    //   yield [input[1], input[0]];
    //   return;
    // }

    // for (var i = 0; i < input.length; i++) {
    //   final element = input[i];
    //   yield* _permutationsRecursive([
    //     ...input.sublist(0, i),
    //     ...input.sublist(i + 1, input.length),
    //   ]).map((l) => l.prepend(element));
    // }
  }

  /// Returns an iterable of iterables which represents the power set of this
  /// iterable.
  Iterable<Iterable<T>> subsets() {
    return _subsetRecursive(this);
  }

  Iterable<Iterable<T>> _subsetRecursive(Iterable<T> input) sync* {
    var index = 0;

    for (var o in input) {
      yield [o];
      yield* _subsetRecursive(input.skip(index)).map((l) => l.prepend(o));
      index++;
    }
  }

  /// Returns the set union between the iterable and the given
  /// collection.
  ///
  /// After applying the [union] method to an iterable, the resulting
  /// iterable will consist of all the distinct elements in the source
  /// iterable as well as the distinct elements in the given [other]
  /// collection. This is equivalent to taking the set union of the two
  /// sequences.
  ///
  /// Optionally, a [selector] can be supplied to refine the comparison. If
  /// one is provided, the [union] method will use the [selector] function in
  /// order to determine equivalency. If omitted, [union] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// Due to the nature of set unions, the resulting iterable will be as though
  /// [distinct] was applied to it, so duplicate elements after the first found
  /// will be discarded. If the intention is to combine elements of two
  /// iterables/collections, use [concat] instead.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = [1, 2, 3, 4];
  ///       final listB = [3, 4, 5, 6];
  ///       final result = listA.union(listB);
  ///
  ///       // Result: [1, 2, 3, 4, 5, 6]
  ///     }
  Iterable<T> union<TKey>(Iterable<T> other,
      [TKey Function(T) selector]) sync* {
    selector ??= (T v) => v as TKey;

    final set = <TKey>{};

    for (var v in this) {
      if (set.add(selector(v))) {
        yield v;
      }
    }

    for (var v in other) {
      if (set.add(selector(v))) {
        yield v;
      }
    }
  }
}
