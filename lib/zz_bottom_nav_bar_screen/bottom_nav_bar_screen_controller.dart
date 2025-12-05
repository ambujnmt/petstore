import '../utils/app_imports.dart';

class BottomNavBarScreenController extends GetxController {
  final currentIndex = 0.obs;

  void setIndex(int index) => currentIndex(index);

  bool canClose = false;
  Future<void> onBackPressed() async {
    if (canClose) {
      SystemNavigator.pop();
      return;
    }
    canClose = true;
    AppToast.show('Press back again to get exit');
    await waitForSec(2);
    canClose = false;
  }

  @override
  void onInit() {
    super.onInit();
    AuthPrefs.setonBoard(true);
    debugPrint('token: ${UserStorage.getToken()}');
  }
}
