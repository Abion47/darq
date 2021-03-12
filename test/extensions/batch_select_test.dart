import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('batchSelect', () {
    test('Group in pairs', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final result = list.batchSelect(2, (group) => '$group');
      expect(result.length, 3);
      expect(result.elementAt(0), '[0, 1]');
      expect(result.elementAt(1), '[2, 3]');
      expect(result.elementAt(2), '[4, 5]');
    });

    test('Group in trios with tail', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final result =
          list.batchSelect(3, (group) => '$group', includeTail: true);
      expect(result.length, 3);
      expect(result.elementAt(0), '[0, 1, 2]');
      expect(result.elementAt(1), '[3, 4, 5]');
      expect(result.elementAt(2), '[6]');
    });

    test('Error: zero count', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final task = () => list.batchSelect(0, (group) => group);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: negative count', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final task = () => list.batchSelect(-1, (group) => group);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
