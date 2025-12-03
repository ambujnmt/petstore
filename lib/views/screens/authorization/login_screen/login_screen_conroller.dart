import '../../../../utils/app_imports.dart';

class LoginScreenConroller extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailError = ''.obs;
  final passwordError = ''.obs;

  Future<void> onLoginTap() async {
    if (!_validator()) return;
    closeKeyboard();
    AppLoader.show();
    final res = await ApiServices.post('/login', payload: {
      'email': emailController.text,
      'password': passwordController.text
    });
    await AppLoader.close();
    if (res != null) {
      await UserStorage.setToken(res['token']);
      final userSuccess = await UserController.getUserData();
      if (!userSuccess) {
        await UserStorage.setToken();
        return;
      }
      Get.back(result: true);
    }
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

  // @override
  // void onInit() {
  //   super.onInit();
  //   AuthPrefs.setonBoard(true);
  // }
}
