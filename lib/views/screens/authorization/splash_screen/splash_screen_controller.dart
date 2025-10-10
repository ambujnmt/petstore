import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/services/global_services.dart';
import 'package:pinkpawscat/shared_prefs/storage/auth_prefs.dart';
import 'package:pinkpawscat/shared_prefs/storage/user_storage.dart';
import 'package:pinkpawscat/views/screens/authorization/login_screen/login_screen.dart';
import 'package:pinkpawscat/zz_bottom_nav_bar_screen/bottom_nav_bar_screen.dart';

import '../onboarding_screen/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  InitialScreen _getInitialScreen() {
    if (!AuthPrefs.onboardDone()) {
      return InitialScreen.onboard;
    } else if (UserStorage.getToken() == null) {
      return InitialScreen.login;
    }

    return InitialScreen.dashboard;
  }

  void _initScreen() async {
    final screen = _getInitialScreen();
    await waitForSec(1);
    if (screen == InitialScreen.onboard) {
      Get.off(() => OnboardingScreen(), transition: Transition.topLevel);
      return;
    } else if (screen == InitialScreen.login) {
      Get.off(() => LoginScreen(), transition: Transition.topLevel);
      return;
    }
    Get.offAll(() => const NavScreen(), transition: Transition.topLevel);
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initScreen();
    });
  }
}

enum InitialScreen { onboard, login, dashboard }
