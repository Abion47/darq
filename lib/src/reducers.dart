import 'package:darq/darq.dart';

import 'package:darq/src/enumerable_iterable.dart';

class EnumerableReducers {
  static num SumNum(Enumerable<num> enumerable) {
    final iterator = enumerable.iterator;
    num sum = 0.0;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }
  
  static int SumInt(Enumerable<int> enumerable) {
    final iterator = enumerable.iterator;
    int sum = 0;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }
  
  static double SumDouble(Enumerable<double> enumerable) {
    final iterator = enumerable.iterator;
    double sum = 0.0;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }
  
  static String SumString(Enumerable<String> enumerable) {
    final iterator = enumerable.iterator;
    String sum = '';
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      sum += iterator.current;
    } while (iterator.moveNext());
    return sum;
  }

  static bool AllBool(Enumerable<bool> enumerable) {
    final iterator = enumerable.iterator;
    while(iterator.moveNext()) {
      if (!iterator.current) return false;
    }
    return true;
  }

  static bool AnyBool(Enumerable<bool> enumerable) {
    final iterator = enumerable.iterator;
    while(iterator.moveNext()) {
      if (iterator.current) return true;
    }
    return false;
  }
  
  static double AverageNum(Enumerable<num> enumerable) {
    final iterator = enumerable.iterator;
    num sum = 0.0;
    int count = 0;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      sum += iterator.current;
      count++;
    } while (iterator.moveNext());
    return sum / count;
  }
  
  static int AverageInt(Enumerable<int> enumerable) {
    final iterator = enumerable.iterator;
    int sum = 0;
    int count = 0;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      sum += iterator.current;
      count++;
    } while (iterator.moveNext());
    return sum ~/ count;
  }
  
  static double AverageDouble(Enumerable<double> enumerable) {
    final iterator = enumerable.iterator;
    double sum = 0.0;
    int count = 0;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      sum += iterator.current;
      count++;
    } while (iterator.moveNext());
    return sum / count;
  }

  static bool ContainsEquals<T>(Enumerable<T> enumerable, T value) {
    final iterator = enumerable.iterator;
    while(iterator.moveNext()) {
      if (iterator.current == value) return true;
    }
    return false;
  }

  static num MinNum(Enumerable<num> enumerable) {
    final iterator = enumerable.iterator;
    num min;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      if (min == null) min = iterator.current;
      else min = min < iterator.current ? min : iterator.current;
    } while (iterator.moveNext());
    return min;
  }
  
  static int MinInt(Enumerable<int> enumerable) {
    final iterator = enumerable.iterator;
    int min;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      if (min == null) min = iterator.current;
      else min = min < iterator.current ? min : iterator.current;
    } while (iterator.moveNext());
    return min;
  }
  
  static double MinDouble(Enumerable<double> enumerable) {
    final iterator = enumerable.iterator;
    double min;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      if (min == null) min = iterator.current;
      else min = min < iterator.current ? min : iterator.current;
    } while (iterator.moveNext());
    return min;
  }
  
  static String MinString(Enumerable<String> enumerable) {
    final iterator = enumerable.iterator;
    String min;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      if (min == null) min = iterator.current;
      else min = min.compareTo(iterator.current) < 0 ? min : iterator.current;
    } while (iterator.moveNext());
    return min;
  }

  static num MaxNum(Enumerable<num> enumerable) {
    final iterator = enumerable.iterator;
    num max;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      if (max == null) max = iterator.current;
      else max = max > iterator.current ? max : iterator.current;
    } while (iterator.moveNext());
    return max;
  }
  
  static int MaxInt(Enumerable<int> enumerable) {
    final iterator = enumerable.iterator;
    int max;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      if (max == null) max = iterator.current;
      else max = max > iterator.current ? max : iterator.current;
    } while (iterator.moveNext());
    return max;
  }
  
  static double MaxDouble(Enumerable<double> enumerable) {
    final iterator = enumerable.iterator;
    double max;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      if (max == null) max = iterator.current;
      else max = max > iterator.current ? max : iterator.current;
    } while (iterator.moveNext());
    return max;
  }
  
  static String MaxString(Enumerable<String> enumerable) {
    final iterator = enumerable.iterator;
    String max;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    do {
      if (max == null) max = iterator.current;
      else max = max.compareTo(iterator.current) > 0 ? max : iterator.current;
    } while (iterator.moveNext());
    return max;
  }
}
