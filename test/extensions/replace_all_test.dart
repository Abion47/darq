import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('replaceAll', () {
    test('replace all elements', () {
      final list = [1, 2, 3, 4, 5];

      final result = list.replaceAll(6);
      expect(result, orderedEquals(<int>[6, 6, 6, 6, 6]));
    });
  });
}
