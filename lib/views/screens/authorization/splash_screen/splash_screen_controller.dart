import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/services/global_services.dart';

import '../onboarding_screen/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  void _initScreen() async {
    await waitForSec(1);
    Get.offAll(() => OnboardingScreen());
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initScreen();
    });
  }
}
