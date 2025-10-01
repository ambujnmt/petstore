import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/screens/get_started_screen.dart';

import '../constants/color_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<String> onboardingImages = [
    "assets/images/onboarding1.png",
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: onboardingImages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onboardingImages[index]),
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
                Row(
                  children: List.generate(
                    onboardingImages.length,
                    (dotIndex) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == dotIndex ? 18 : 18,
                      height: 8,
                      decoration: BoxDecoration(
                          color: _currentIndex == dotIndex
                              ? ColorConstants.indictorColor
                              : Colors.white54,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: _currentIndex == dotIndex
                                ? ColorConstants.indictorColor
                                : Colors.grey,
                          )
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_currentIndex < onboardingImages.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Get.to(const GetStartedScreen());
                    }
                  },
                  child: Image.asset(
                    'assets/images/nextbtn.png',
                    width: 200,
                    height: 60,
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
