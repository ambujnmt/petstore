import '../utils/app_imports.dart';

class UserController {
  static bool get isLoggedIn => UserStorage.getToken() != null;

  static Future<bool> getUserData() async {
    AppLoader.show();
    final res = await _fetchUserData();
    if (res != null) {
      await UserStorage.setUserData(res['profile']);
      await AppLoader.close();
      return true;
    }
    await AppLoader.close();
    return false;
  }

  static Future<bool> logoutUser() async {
    final no = !await AppDialog.confirm(
      title: 'Logout',
      message: 'Are you sure, logout now?',
    );
    if (no) return false;
    AppLoader.show();
    final res = await ApiServices.post('/logout');
    if (res == null) {
      AppToast.error('Something went wrong.');
      AppLoader.close();
      return false;
    }
    await SharedPrefs.clear();
    await AppLoader.close();
    AuthPrefs.setonBoard(true);
    return true;
  }

  static Future<bool> refreshUserData() async {
    final res = await _fetchUserData();
    if (res != null) {
      await UserStorage.setUserData(res['profile']);
      return true;
    }
    return false;
  }

  static Future _fetchUserData() async {
    return await ApiServices.get('/profile');
  }
}
