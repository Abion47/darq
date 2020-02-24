import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('batch', () {
    test('Group in pairs', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final result = list.batch(2);
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals([0, 1]));
      expect(result.elementAt(1), orderedEquals([2, 3]));
      expect(result.elementAt(2), orderedEquals([4, 5]));
    });

    test('Group in trios with tail', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final result = list.batch(3, includeTail: true);
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals([0, 1, 2]));
      expect(result.elementAt(1), orderedEquals([3, 4, 5]));
      expect(result.elementAt(2), orderedEquals([6]));
    });

    test('Error: null count', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final task = () => list.batch(null);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: zero count', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final task = () => list.batch(0);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: negative count', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final task = () => list.batch(-1);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
