import 'package:darq/darq.dart';

void main() {
  final numbers = List.generate(100, (i) => i * 100);
  final enumerable = E(numbers);

  for (var value in enumerable) {
    print(value);
  }

  print(enumerable.Max());
  print(enumerable.Min());

  print(enumerable.Average());
  print(enumerable.Sum());
}