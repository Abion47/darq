import 'package:darq/darq.dart';

//void main() {
//  benchmark();
//}

typedef T2 Foo2<T1, T2>(T1 a);
typedef T3 Foo3<T1, T2, T3>(T1 a, T2 b);

class Bar<A> {
  final List<A> outer;
  Bar(this.outer);

  void run<B, C, D>(
    List<B> inner,
    Foo2<A, C> outerSelector,
    Foo2<B, C> innerSelector,
    Foo3<A, B, D> resultSelector,
  ) {
    print([A, B, C, D]);
    print([
      outer.runtimeType,
      inner.runtimeType,
      outerSelector.runtimeType,
      innerSelector.runtimeType,
      resultSelector.runtimeType
    ]);
  }
}

class Person {
  final String name;
  Person(this.name);
}

class Pet {
  final String name;
  final String owner;
  Pet(this.name, this.owner);
}

main() {
  final map = {'a': 1, 'b': 2};
  print(map.runtimeType);
  print(map.keys.runtimeType);
  print(map.values.runtimeType);
}

void benchmark() {
  final source = List.generate(1000000, (i) => i);
  final iterations = 100;
  final benchmarks = List<double>(iterations);

  // LINQ style
  for (int i = 0; i < iterations; i++) {
    final start = DateTime.now();

    // ======================BENCHMARK START=============================
    final result =
        E(source).groupByE((i) => i % 3).selectE((g) => g.averageE());
    for (var _ in result) {
      // Do something with the value
    }
    // ======================BENCHMARK END===============================

    final end = DateTime.now();

    benchmarks[i] =
        (end.microsecondsSinceEpoch - start.microsecondsSinceEpoch) / 1000000;
  }

  print(
      'Average execution time in seconds (LINQ): ${E(benchmarks).averageE()}');

  // Vanilla Style
  for (int i = 0; i < iterations; i++) {
    final start = DateTime.now();

    // ======================BENCHMARK START=============================
    final result = <List<int>>[[], [], []];
    for (var i in source) {
      result[i % 3].add(i);
    }
    for (var g in result) {
      var total = 0;
      for (var i in g) {
        total += i;
      }
      final _ = total / g.length;
      // Go something with the value
    }
    // ======================BENCHMARK END===============================

    final end = DateTime.now();

    benchmarks[i] =
        (end.microsecondsSinceEpoch - start.microsecondsSinceEpoch) / 1000000;
  }

  print(
      'Average execution time in seconds (Vanilla): ${E(benchmarks).averageE()}');
}
