import '../utils/app_imports.dart';

void closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<void> waitForSec(int sec) async {
  return await Future.delayed(Duration(seconds: sec));
}

Future<void> waitForMilliSec(int milliSec) async {
  return await Future.delayed(Duration(milliseconds: milliSec));
}

Color fromHex(String hexCode) {
  hexCode = hexCode.replaceAll('#', '');
  if (hexCode.length == 6) {
    hexCode = 'FF$hexCode'; // add alpha value if missing
  }
  return Color(int.parse('0x$hexCode'));
}
