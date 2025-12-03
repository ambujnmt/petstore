import 'package:pinkpawscat/zz_bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
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

  static Future<void> logoutUser() async {
    final no = !await AppDialog.confirm(
      title: 'Logout',
      message: 'Are you sure, logout now?',
    );
    if (no) return;
    AppLoader.show();
    final res = await ApiServices.post('/logout');
    if (res == null) {
      AppToast.error('Something went wrong.');
      AppLoader.close();
      return;
    }
    await Get.deleteAll(force: true);
    await SharedPrefs.clear();
    await AppLoader.close();
    Get.offAll(() => const BottomNavScreen(), transition: Transition.topLevel);
  }

  static Future<void> refreshUserData([int? userId]) async {
    if (userId == null) {
      final user = UserStorage.getUserData();
      userId = user!.id;
    }
    final res = await _fetchUserData();
    if (res != null) {
      await UserStorage.setUserData(res['data']);
    }
  }

  static Future _fetchUserData() async {
    return await ApiServices.get('/profile');
  }
}
