import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('toStream', () {
    test('int list to stream', () {
      final input = [1, 2, 3, 4, 5];
      final result = input.toStream();
      expect(result, emitsInOrder(<int>[1, 2, 3, 4, 5]));
    });

    test('int list to stream', () {
      final input = [1, 2, 3, 4, 5];
      final result = input.toStream(isBroadcast: true);

      final listener1 = result.map((i) => i);
      final listener2 = result.map((i) => i * 2);

      expect(listener1, emitsInOrder(<int>[1, 2, 3, 4, 5]));
      expect(listener2, emitsInOrder(<int>[2, 4, 6, 8, 10]));
    });
  });
}
