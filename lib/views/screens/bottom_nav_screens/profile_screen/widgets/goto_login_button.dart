import '../../../../../utils/app_imports.dart';
import '../../../authorization/login_screen/login_screen.dart';

Widget gotoLoginButton({VoidCallback? onLoginSuccess}) {
  return AppButton(
    text: 'Login',
    width: 180,
    bgColorOpacity: .73,
    height: 34,
    onTap: () async {
      final user = UserStorage.getUserData();
      if (user != null) {
        onLoginSuccess?.call();
        return;
      }
      final loginSuccess = await Get.to(() => LoginScreen()) ?? false;
      if (loginSuccess) {
        onLoginSuccess?.call();
      }
    },
  );
}
