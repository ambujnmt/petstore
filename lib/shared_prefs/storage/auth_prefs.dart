import '../../utils/app_imports.dart';

class AuthPrefs {
  static const _onboardKey = 'onboard_key';

  static bool onboardDone() {
    return SharedPrefs.getBool(_onboardKey) ?? false;
  }

  static Future<void> setonBoard(bool val) async {
    await SharedPrefs.setBool(_onboardKey, val);
  }
}
