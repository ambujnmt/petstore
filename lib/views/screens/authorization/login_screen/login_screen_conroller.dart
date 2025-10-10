import 'package:pinkpawscat/shared_prefs/storage/auth_prefs.dart';
import 'package:pinkpawscat/shared_prefs/storage/user_storage.dart';
import '../../../../utils/app_imports.dart';
import '../../nav_screen.dart';

class LoginScreenConroller extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailError = ''.obs;
  final passwordError = ''.obs;

  Future<void> onLoginTap() async {
    if (!_validator()) return;
    await UserStorage.setToken('dfdkjfd');
    Get.to(() => const NavScreen());
  }

  bool _validator() {
    if (!GetUtils.isEmail(emailController.text)) {
      emailError('Enter valid email');
      return false;
    } else if (passwordController.text.length < 8) {
      passwordError('Password must have at least 8 characters');
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    super.onInit();
    AuthPrefs.setonBoard(true);
  }
}
