import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('awaitAny', () {
    test('await futures', () async {
      final list = [Future.value(1)];
      final result = await list.awaitAny();
      expect(result, 1);
    });

    test('await delayed futures', () async {
      final list = [
        Future.delayed(Duration(seconds: 3)).then((_) => 1),
        Future.delayed(Duration(seconds: 2)).then((_) => 2),
        Future.delayed(Duration(seconds: 1)).then((_) => 3),
      ];
      final result = await list.awaitAny();
      expect(result, 3);
    });
  });
}
