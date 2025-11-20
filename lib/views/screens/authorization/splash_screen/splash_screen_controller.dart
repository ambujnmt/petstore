import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/services/global_services.dart';
import 'package:pinkpawscat/shared_prefs/storage/user_storage.dart';
import 'package:pinkpawscat/zz_bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:video_player/video_player.dart';

import '../onboarding_screen/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  final showLoader = false.obs;

  InitialScreen _getInitialScreen() {
    // if (!AuthPrefs.onboardDone()) {
    //   return InitialScreen.onboard;
    // } else
    if (UserStorage.getToken() == null) {
      return InitialScreen.onboard;
    }

    return InitialScreen.dashboard;
  }

  void _initScreen() async {
    await waitForMilliSec(1800);
    showLoader(true);
    final screen = _getInitialScreen();
    await waitForSec(1);
    if (screen == InitialScreen.onboard) {
      final videoController =
          VideoPlayerController.asset("assets/videos/intro_video.mp4");
      await videoController.initialize();
      await videoController.setLooping(true);
      Get.off(
        () => OnboardingScreen(videoController: videoController),
      );
      return;
    }
    // else if (screen == InitialScreen.login) {
    //   Get.off(() => LoginScreen(), transition: Transition.topLevel);
    //   return;
    // }
    Get.offAll(() => const BottomNavScreen(), transition: Transition.topLevel);
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initScreen();
    });
  }
}

enum InitialScreen { onboard, dashboard }
