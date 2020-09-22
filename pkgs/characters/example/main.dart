import 'package:characters/characters.dart';

// Small API examples. For full API docs see:
// https://pub.dev/documentation/characters/latest/characters/characters-library.html
void main() {
  var hi = 'Hi 🇩🇰';
  print('String is "$hi"\n');

  // Length.
  print('String.length: ${hi.length}');
  print('Characters.length: ${hi.characters.length}\n');

  // Last character.
  print('The string ends with: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}\n');

  // Skip last character.
  print('Substring -1: "${hi.substring(0, hi.length - 1)}"');
  print('Skipping last character: "${hi.characters.skipLast(1)}"\n');

  // Replace characters.
  var newHi = hi.characters.replaceAll('🇩🇰'.characters, '🇺🇸'.characters);
  print('Change flag: "$newHi"');
}
