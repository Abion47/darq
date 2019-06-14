import 'package:darq/darq.dart';

void main() {
  final iterations = 100;
  final benchmarks = List<double>(iterations);
  for (int i = 0; i < iterations; i++) {
    benchmarks[i] = benchmark();
  }

  final sum = E(benchmarks).averageE();
  print('Average execution time in seconds: $sum');
}

double benchmark() {
  final source = List.generate(1000000, (i) => i);

  final start = DateTime.now();

  final result = E(source).groupByE((i) => i % 3).selectE((g) => g.averageE());
  for (var avg in result) {
    // Do something with `avg`
  }

  // source.map((i) => i % 3);
  // final result = <List<int>>[[], [], []];
  // for (var i in source) {
  //   result[i % 3].add(i);
  // }
  // for (var g in result) {
  //   var total = 0;
  //   for (var i in g) {
  //     total += i;
  //   }
  //   final avg = total / g.length;
  //   // Go something with `avg`
  // }

  final end = DateTime.now();

  return (end.microsecondsSinceEpoch - start.microsecondsSinceEpoch) / 1000000;
}