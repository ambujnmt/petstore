import 'package:pinkpawscat/views/screens/bottom_nav_screens/profile_screen/profile_screen_controller.dart';

import '../../../utils/app_imports.dart';

class UpdateProfileScreenController extends GetxController {
  final user = UserStorage.getUserData().obs;

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final fNameError = ''.obs;
  final lNameError = ''.obs;
  final emailError = ''.obs;
  final phoneError = ''.obs;

  Future<void> onSubmit() async {
    if (!_validate() ||
        !await AppDialog.confirm(
            message: 'Are you sure you want to update your profile?')) {
      return;
    }
    closeKeyboard();
    AppLoader.show();
    final res = await ApiServices.post('/update-profile', payload: {
      'first_name': fNameController.text,
      'last_name': lNameController.text
    });
    await AppLoader.close();
    if (res != null) {
      await UserStorage.setUserData(user.value!
          .copyWith(
              displayName: '${fNameController.text} ${lNameController.text}')
          .toJson());
      AppToast.success('Profile updated successfully');
      refreshData();
      Get.find<ProfileScreenController>().refreshData();
    }
  }

  bool _validate() {
    if (fNameController.text.isEmpty) {
      fNameError.value = 'First name is required';
      return false;
    } else if (lNameController.text.isEmpty) {
      lNameError.value = 'Last name is required';
      return false;
    }
    return true;
  }

  Future<void> refreshData() async {
    user.value = UserStorage.getUserData();
    if (user.value != null) {
      final nameList = user.value?.displayName.split(' ') ?? [];
      if (nameList.isNotEmpty) {
        fNameController.text = nameList.first;
        if (nameList.length > 1) {
          lNameController.text = nameList.sublist(1).join(' ');
        }
      }
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
