import '../utility/tuple.dart';

extension CartesianExtension<T> on Iterable<T> {
  /// Generates the cartesian product of this iterable and [other].
  ///
  /// Generates all the elements in the cartesian product between this
  /// and the provided [other] iterable. The resulting iterable will consist
  /// of an iterable of [Tuple2] with each combination of each element from this
  /// iterable and each element from [other].
  Iterable<Tuple2<T, T2>> cartesian<T2>(Iterable<T2> other) sync* {
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
}
