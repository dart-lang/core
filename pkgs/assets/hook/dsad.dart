import 'package:assets/src/assets.dart';

Future<void> main(List<String> arguments) async {
  final asset = const StringAsset('package/myPackageName/myData1');
  final json = await asset.load();
  print(json);
}
