import 'package:args/args.dart';
import 'package:test/test.dart';

void main() {
  group('Short flag with equals syntax', () {
    test('should parse value correctly without including equals sign', () {
      final parser = ArgParser();
      parser.addOption('option', abbr: 'o');

      // Test long flag with equals
      final result1 = parser.parse(['--option=value']);
      expect(result1['option'], equals('value'));

      // Test short flag with equals - currently fails
      final result2 = parser.parse(['-o=value']);
      expect(result2['option'], equals('value')); // Currently gets '=value'

      // Test short flag with space (this works correctly)
      final result3 = parser.parse(['-o', 'value']);
      expect(result3['option'], equals('value'));

      // All three should produce the same result
      expect(result1['option'], equals(result2['option']));
      expect(result2['option'], equals(result3['option']));
    });

    test('should handle complex values with equals', () {
      final parser = ArgParser();
      parser.addOption('config', abbr: 'c');

      final result1 = parser.parse(['--config=key=value']);
      final result2 = parser.parse(['-c=key=value']);

      expect(result1['config'], equals('key=value'));
      expect(result2['config'],
          equals('key=value')); // Currently gets '=key=value'
    });

    test('should handle empty value after equals', () {
      final parser = ArgParser();
      parser.addOption('value', abbr: 'v');

      final result1 = parser.parse(['--value=']);
      final result2 = parser.parse(['-v=']);

      expect(result1['value'], equals(''));
      expect(result2['value'], equals('')); // Currently gets '='
    });

    test('should work with real-world example (bundle ID)', () {
      final parser = ArgParser();
      parser.addOption('ios-bundle-id', abbr: 'i');

      final bundleId = 'com.example.app';

      final result1 = parser.parse(['--ios-bundle-id=$bundleId']);
      final result2 = parser.parse(['-i=$bundleId']);

      expect(result1['ios-bundle-id'], equals(bundleId));
      expect(result2['ios-bundle-id'],
          equals(bundleId)); // Currently gets '=com.example.app'
    });
  });
}
