import 'package:video_player/video_player.dart';
import '../../../../utils/app_imports.dart';
import '../../../../zz_bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import '../onboarding_screen/onboarding_screen.dart';

enum InitialScreen { onboard, dashboard }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.selctedColor,
      body: Center(
        child: SizedBox(
          height: Get.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                height: 170,
                width: 170,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.cover,
                color: white,
                Images.splash,
              ),
              Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Obx(() => showLoader.value
                      ? AppLoader.widget(color1: white, color2: white)
                      : const SizedBox()))
            ],
          ),
        ),
      ),
    );
  }
}
