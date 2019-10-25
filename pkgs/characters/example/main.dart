import 'package:characters/characters.dart';

// Small API examples. For full API docs see:
// https://pub.dev/documentation/characters/latest/characters/characters-library.html
main() {
  String hi = 'Hi 🇩🇰';
  print('String is "$hi"\n');

  // Length.
  print('String.length: ${hi.length}');
  print('Characters.length: ${Characters(hi).length}\n');

  // Skip last character.
  print('String.substring: "${hi.substring(0, hi.length - 1)}"');
  print('Characters.skipLast: "${Characters(hi).skipLast(1)}"\n');

  // Replace characters.
  Characters newHi =
      Characters(hi).replaceAll(Characters('🇩🇰'), Characters('🇺🇸'));
  print('Change flag: "$newHi"');
}
