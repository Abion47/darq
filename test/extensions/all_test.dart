import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('all', () {
    test('on bool: all true', () {
      final list = [true, true, true, true];
      final result = list.all();
      expect(result, isTrue);
    });

    test('on bool: one false', () {
      final list = [true, true, true, false];
      final result = list.all();
      expect(result, isFalse);
    });

    test('on ints: all even', () {
      final list = [2, 4, 6, 8];
      final result = list.all((x) => x.isEven);
      expect(result, isTrue);
    });

    test('on ints: one odd', () {
      final list = [2, 4, 6, 7];
      final result = list.all((x) => x.isEven);
      expect(result, isFalse);
    });

    test('Error: null condition on non-bool list', () {
      final list = [2, 4, 6, 8];
      final task = () => list.all();
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
