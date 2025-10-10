import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/utils/app_imports.dart';
import 'package:pinkpawscat/utils/images.dart';
import 'package:pinkpawscat/views/screens/authorization/get_started_screen/get_started_screen.dart';
import '../../../../constants/color_constants.dart';
import 'onboarding_screen_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final _con = Get.put(OnboardingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _con.tabController,
            onPageChanged: (index) => _con.currentIndex(index),
            itemCount: _onboardingImages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_onboardingImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Row(
                    children: List.generate(
                      _onboardingImages.length,
                      (dotIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _con.currentIndex.value == dotIndex ? 18 : 18,
                        height: 8,
                        decoration: BoxDecoration(
                            color: _con.currentIndex.value == dotIndex
                                ? ColorConstants.indictorColor
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: _con.currentIndex.value == dotIndex
                                  ? ColorConstants.indictorColor
                                  : Colors.grey,
                            )),
                      ),
                    ),
                  ),
                ),
                widthSpace100,
                Expanded(
                  child: AppButton(
                    height: 60,
                    text: 'Next',
                    textSize: 28,
                    radius: 50,
                    suffix: [
                      widthSpace15,
                      Image.asset(height: 18, width: 18, Images.arrowRightIcon)
                    ],
                    onTap: () {
                      if (_con.currentIndex.value <
                          _onboardingImages.length - 1) {
                        _con.tabController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.to(() => const GetStartedScreen());
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> _onboardingImages = [
  "assets/images/onboarding1.png",
  "assets/images/onboarding2.png",
  "assets/images/onboarding3.png",
];
