import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('awaitAll', () {
    test('await futures', () async {
      final list = [Future.value(1), Future.value(2), Future.value(3)];
      final result = await list.awaitAll();
      expect(result, orderedEquals([1, 2, 3]));
    });

    test('await delayed futures', () async {
      final list = [
        Future.delayed(Duration(seconds: 3)).then((_) => 1),
        Future.delayed(Duration(seconds: 2)).then((_) => 2),
        Future.delayed(Duration(seconds: 1)).then((_) => 3),
      ];
      final result = await list.awaitAll();
      expect(result, orderedEquals([1, 2, 3]));
    });
  });
}
