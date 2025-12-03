import '../../../../utils/app_imports.dart';

class SignupScreenController extends GetxController {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final nameError = ''.obs;
  final mobileError = ''.obs;
  final emailError = ''.obs;
  final passError = ''.obs;
  final cPassError = ''.obs;

  Future<void> onSignupTap() async {
    if (!_validator()) return;
    closeKeyboard();
    AppLoader.show();
    final res = await ApiServices.post('/signup', payload: {
      'full_name': nameController.text,
      'mobile_number': mobileController.text,
      'email_address': emailController.text,
      'password': passwordController.text,
      'confirm_password': confirmPasswordController.text
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
    if (nameController.text.isEmpty) {
      nameError('Enter name');
      return false;
    } else if (mobileController.text.isEmpty) {
      mobileError('Enter mobile number');
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError('Enter valid email address');
      return false;
    } else if (passwordController.text.length < 8) {
      passError('Password must be at least 8 characters');
      return false;
    } else if (confirmPasswordController.text != passwordController.text) {
      cPassError('Confirm password didn\'t match');
      return false;
    }
    return true;
  }
}
