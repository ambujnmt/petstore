import 'package:pinkpawscat/views/screens/authorization/login_screen/login_screen.dart';

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
    Get.offAll(() => LoginScreen(), transition: Transition.topLevel);
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
