import 'package:darq/darq.dart';

void main() {
  final numbers = List.generate(100, (i) => i * 100);
  final enumerable = E(numbers);

  for (var value in enumerable) {
    print(value);
  }

  print(enumerable.eMax());
  print(enumerable.eMin());

  print(enumerable.eAverage());
  print(enumerable.eSum());
}
