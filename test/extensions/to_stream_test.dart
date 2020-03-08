import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('toStream', () {
    test('int list to stream', () {
      final input = [1, 2, 3, 4, 5];
      final result = input.toStream();
      expect(result, emitsInOrder([1, 2, 3, 4, 5]));
    });
  });
}
