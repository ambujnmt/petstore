import '../../../utils/app_imports.dart';

class UpdateProfileScreenController extends GetxController {
  final user = UserStorage.getUserData().obs;

  final fNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final fNameError = ''.obs;
  final emailError = ''.obs;
  final phoneError = ''.obs;

  Future<void> onSubmit() async {}

  Future<void> refreshData() async {
    if (user.value != null) {
      fNameController.text = user.value?.displayName ?? '';
      emailController.text = user.value?.email ?? '';
      phoneController.text = user.value?.mobile ?? '';
    }
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
