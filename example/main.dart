import 'package:darq/darq.dart';

void main() {
  benchmark();
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
