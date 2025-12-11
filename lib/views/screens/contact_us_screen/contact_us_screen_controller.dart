import '../../../utils/app_imports.dart';

class ContactUsScreenController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final howController = TextEditingController();

  final nameError = ''.obs;
  final phoneError = ''.obs;
  final emailError = ''.obs;

  Future<void> onSendTap() async {
    if (!_validate()) return;
    closeKeyboard();
    AppLoader.show();
    final res = await ApiServices.post('endPoint', payload: {});
    await AppLoader.close();
    if (res != null) {
      AppToast.success('Your submission was successful.');
    }
  }

  bool _validate() {
    if (nameController.text.isEmpty) {
      nameError('Please enter your name.');
      return false;
    } else if (phoneController.text.isNotEmpty &&
        !GetUtils.isPhoneNumber(phoneController.text)) {
      phoneError('Please enter valid phone number.');
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError('Please enter valid email address.');
      return false;
    }
    return true;
  }
}
