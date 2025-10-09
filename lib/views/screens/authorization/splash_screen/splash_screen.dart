import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/custom_text.dart';
import 'splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstants.splashColor,
      body: Center(
        child: Container(
          height: height * .2,
          width: width * .4,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/logo.png'))),
        ),
      ),
    );
  }
}
