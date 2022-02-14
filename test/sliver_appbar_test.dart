import 'package:flutter_test/flutter_test.dart';

void main() {
  group('integer test', () {
    test('add test', () {
      expect(42 + 42, 84);
    });
    test('minuts test', () {
      expect(1 / 0, double.infinity);
    });
  });
}
