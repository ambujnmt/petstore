import 'dart:convert';
import '../../utils/app_imports.dart';

class UserStorage {
  static const _userDataKey = 'user_data_key';
  static const _userTokenKey = 'user_token_key';

  static Future<void> setUserData([Map<String, dynamic>? data]) async {
    if (data == null) {
      SharedPrefs.remove(_userDataKey);
    }
    await SharedPrefs.setString(_userDataKey, jsonEncode(data));
  }

  // static UserModel getUserData() {
  //   final user = SharedPrefs.getString(_userDataKey);
  //   return UserModel.fromJson(jsonDecode(user!));
  // }

  static bool isUserDataAvailable() {
    if (SharedPrefs.containsKey(_userDataKey)) {
      final user = SharedPrefs.getString(_userDataKey);
      return user != null && user.isNotEmpty && user != 'null';
    }
    return false;
  }

  static Future<void> setToken([String? token]) async {
    if (token == null) {
      SharedPrefs.remove(_userTokenKey);
      return;
    }
    await SharedPrefs.setString(_userTokenKey, token);
  }

  static String? getToken() => SharedPrefs.getString(_userTokenKey);
}
