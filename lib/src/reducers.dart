import 'enumerable.dart';
import 'errors.dart';

class SumReducers {
  static final director = <Type, dynamic>{
    num: SumNum,
    int: SumInt,
    double: SumDouble,
    String: SumString,
    Duration: SumDuration,
    BigInt: SumBigInt,
  };

  static num SumNum(Enumerable<num> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    num sum = 0.0;
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }

  static int SumInt(Enumerable<int> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    int sum = 0;
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }

  static double SumDouble(Enumerable<double> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    double sum = 0.0;
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }

  static String SumString(Enumerable<String> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    String sum = '';
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }

  static Duration SumDuration(Enumerable<Duration> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    Duration sum = Duration.zero;
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }

  static BigInt SumBigInt(Enumerable<BigInt> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    BigInt sum = BigInt.zero;
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }
}

class AllReducers {
  static bool AllBool(Enumerable<bool> enumerable) {
    final iterator = enumerable.iterator;
    while (iterator.moveNext()) {
      if (!iterator.current) return false;
    }
    return true;
  }
}

class AnyReducers {
  static bool AnyBool(Enumerable<bool> enumerable) {
    final iterator = enumerable.iterator;
    while (iterator.moveNext()) {
      if (iterator.current) return true;
    }
    return false;
  }
}

class AverageReducers {
  static final director = <Type, dynamic>{
    num: AverageNum,
    int: AverageInt,
    double: AverageDouble,
    Duration: AverageDuration,
    BigInt: AverageBigInt,
  };

  static double AverageNum(Enumerable<num> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    num sum = 0.0;
    int count = 0;
    do {
      sum += iterator.current;
      count++;
    } while (iterator.moveNext());
    return sum / count;
  }

  static int AverageInt(Enumerable<int> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    int sum = 0;
    int count = 0;
    do {
      sum += iterator.current;
      count++;
    } while (iterator.moveNext());
    return sum ~/ count;
  }

  static double AverageDouble(Enumerable<double> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    double sum = 0.0;
    int count = 0;
    do {
      sum += iterator.current;
      count++;
    } while (iterator.moveNext());
    return sum / count;
  }

  static Duration AverageDuration(Enumerable<Duration> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    Duration sum = Duration.zero;
    int count = 0;
    do {
      sum += iterator.current;
      count++;
    } while (iterator.moveNext());
    return sum ~/ count;
  }

  static BigInt AverageBigInt(Enumerable<BigInt> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    BigInt sum = BigInt.zero;
    int count = 0;
    do {
      sum += iterator.current;
      count++;
    } while (iterator.moveNext());
    return sum ~/ BigInt.from(count);
  }
}

class ContainsReducers {
  static bool ContainsEquals<T>(Enumerable<T> enumerable, T value) {
    final iterator = enumerable.iterator;
    while (iterator.moveNext()) {
      if (iterator.current == value) return true;
    }
    return false;
  }
}

class MinReducers {
  static final director = <Type, dynamic>{
    num: MinNum,
    int: MinInt,
    double: MinDouble,
    String: MinString,
    Duration: MinDuration,
    BigInt: MinBigInt,
  };

  static num MinNum(Enumerable<num> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    num min;
    do {
      if (min == null) {
        min = iterator.current;
      } else {
        min = min < iterator.current ? min : iterator.current;
      }
    } while (iterator.moveNext());
    return min;
  }

  static int MinInt(Enumerable<int> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    int min;
    do {
      if (min == null) {
        min = iterator.current;
      } else {
        min = min < iterator.current ? min : iterator.current;
      }
    } while (iterator.moveNext());
    return min;
  }

  static double MinDouble(Enumerable<double> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    double min;
    do {
      if (min == null) {
        min = iterator.current;
      } else {
        min = min < iterator.current ? min : iterator.current;
      }
    } while (iterator.moveNext());
    return min;
  }

  static String MinString(Enumerable<String> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    String min;
    do {
      if (min == null) {
        min = iterator.current;
      } else {
        min = min.compareTo(iterator.current) < 0 ? min : iterator.current;
      }
    } while (iterator.moveNext());
    return min;
  }

  static Duration MinDuration(Enumerable<Duration> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    Duration min;
    do {
      if (min == null) {
        min = iterator.current;
      } else {
        min = min.compareTo(iterator.current) < 0 ? min : iterator.current;
      }
    } while (iterator.moveNext());
    return min;
  }

  static BigInt MinBigInt(Enumerable<BigInt> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    BigInt min;
    do {
      if (min == null) {
        min = iterator.current;
      } else {
        min = min.compareTo(iterator.current) < 0 ? min : iterator.current;
      }
    } while (iterator.moveNext());
    return min;
  }
}

class MaxReducers {
  static final director = <Type, dynamic>{
    num: MaxNum,
    int: MaxInt,
    double: MaxDouble,
    String: MaxString,
    Duration: MaxDuration,
    BigInt: MaxBigInt,
  };

  static num MaxNum(Enumerable<num> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    num max;
    do {
      if (max == null) {
        max = iterator.current;
      } else {
        max = max > iterator.current ? max : iterator.current;
      }
    } while (iterator.moveNext());
    return max;
  }

  static int MaxInt(Enumerable<int> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    int max;
    do {
      if (max == null) {
        max = iterator.current;
      } else {
        max = max > iterator.current ? max : iterator.current;
      }
    } while (iterator.moveNext());
    return max;
  }

  static double MaxDouble(Enumerable<double> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    double max;
    do {
      if (max == null) {
        max = iterator.current;
      } else {
        max = max > iterator.current ? max : iterator.current;
      }
    } while (iterator.moveNext());
    return max;
  }

  static String MaxString(Enumerable<String> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    String max;
    do {
      if (max == null) {
        max = iterator.current;
      } else {
        max = max.compareTo(iterator.current) > 0 ? max : iterator.current;
      }
    } while (iterator.moveNext());
    return max;
  }

  static Duration MaxDuration(Enumerable<Duration> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    Duration max;
    do {
      if (max == null) {
        max = iterator.current;
      } else {
        max = max.compareTo(iterator.current) > 0 ? max : iterator.current;
      }
    } while (iterator.moveNext());
    return max;
  }

  static BigInt MaxBigInt(Enumerable<BigInt> enumerable) {
    final iterator = enumerable.iterator;
    if (!iterator.moveNext()) throw EnumerableError.isEmpty();
    BigInt max;
    do {
      if (max == null) {
        max = iterator.current;
      } else {
        max = max.compareTo(iterator.current) > 0 ? max : iterator.current;
      }
    } while (iterator.moveNext());
    return max;
  }
}
