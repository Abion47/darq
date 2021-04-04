import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('zip', () {
    test('zipping into Strings', () {
      final a = [1, 2, 3, 4];
      final b = [5.0, 6.0, 7.0];

      final output = a.zip(b, (x, y) => '$x-$y');
      expect(output, orderedEquals(<String>['1-5.0', '2-6.0', '3-7.0']));
    });
  });
}
