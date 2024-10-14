To re-generate generated files run:
```
 dart tool/generate.dart
```

To update to new data files, update the paths in `tool/src/data_files`
if necessary, and run `dart tool.generate.dart -u -o`.
The `-u` means read new files from `https://unicode.org/Public`,
and `-o` means try to optimize table chunk sizes,
which is most important when using new data files.

