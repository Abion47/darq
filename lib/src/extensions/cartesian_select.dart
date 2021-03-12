extension CartesianSelectExtension<T> on Iterable<T> {
  /// Generates the cartesian product of this iterable and [other], returning an
  /// iterable of mapped elements.
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided [other] iterable. Each combination of element from this
  /// iterable and each element from [other] will be passed to [selector] to
  /// generate the result.
  Iterable<TResult> cartesianSelect<T2, TResult>(
    Iterable<T2> other,
    TResult Function(T element, T2 otherElement) selector,
  ) sync* {
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
    TResult Function(T element, T2 o2Element, T3 o3Element) selector,
  ) sync* {
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
    TResult Function(T element, T2 o2Element, T3 o3Element, T4 o4Element)
        selector,
  ) sync* {
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
    TResult Function(
            T element, T2 o2Element, T3 o3Element, T4 o4Element, T5 o5Element)
        selector,
  ) sync* {
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
    TResult Function(T element, T2 o2Element, T3 o3Element, T4 o4Element,
            T5 o5Element, T6 o6Element)
        selector,
  ) sync* {
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
    TResult Function(T element, T2 o2Element, T3 o3Element, T4 o4Element,
            T5 o5Element, T6 o6Element, T7 o7Element)
        selector,
  ) sync* {
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
    TResult Function(T element, T2 o2Element, T3 o3Element, T4 o4Element,
            T5 o5Element, T6 o6Element, T7 o7Element, T8 o8Element)
        selector,
  ) sync* {
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
    TResult Function(
            T element,
            T2 o2Element,
            T3 o3Element,
            T4 o4Element,
            T5 o5Element,
            T6 o6Element,
            T7 o7Element,
            T8 o8Element,
            T9 o9Element)
        selector,
  ) sync* {
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
}
