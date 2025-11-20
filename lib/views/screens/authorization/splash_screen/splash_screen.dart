import 'package:pinkpawscat/helpers/app_loader.dart';
import '../../../../utils/app_imports.dart';
import 'splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final con = Get.put(SplashScreenController());
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
                  child: Obx(() => con.showLoader.value
                      ? AppLoader.widget(color1: white, color2: white)
                      : const SizedBox()))
            ],
          ),
        ),
      ),
    );
  }
}
