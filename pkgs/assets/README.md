[![pub package](https://img.shields.io/pub/v/assets.svg)](https://pub.dev/packages/assets)
[![package publisher](https://img.shields.io/pub/publisher/assets.svg)](https://pub.dev/packages/assets/publisher)

> [!WARNING]  
> This package is experimental only and part of the native assets effort.

# Data asset loading and treeshaking

## Usage

### Adding assets

In your project, create a `hook/build.dart`:

```dart
import 'package:assets/assets_hook.dart';
import 'package:native_assets_cli/data_assets.dart';

void main(List<String> arguments) {
  build(arguments, (input, output) async {
    final jsonFile1 = Uri.file('path/to/file');
    final jsonFile2 = Uri.file('path/to/other/file');

    await AssetBuilder.stringFiles({
      'myData1': jsonFile1,
      'myData2': jsonFile2,
    }).run(input: input, output: output);
  });
}
```

This will bundle the assets with your app, so they can be loaded at runtime.

### Load assets

At runtime, you can access the data by:

```dart
import 'package:assets/src/assets.dart';

Future<void> main(List<String> arguments) async {
  final asset = const StringAsset(package: 'myPackage', name: 'myData1');
  final json = await asset.load();
  print(json);
}
```

### Treeshaking

As the asset `myData2` was not used in the above application, it will be
removed from you application when compiling for release.
