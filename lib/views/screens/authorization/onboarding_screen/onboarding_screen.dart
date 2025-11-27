import 'package:pinkpawscat/utils/app_imports.dart';
import 'package:pinkpawscat/zz_bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:video_player/video_player.dart';
// import 'onboarding_screen_controller.dart';

class OnboardingScreen extends StatefulWidget {
  final VideoPlayerController videoController;
  const OnboardingScreen({super.key, required this.videoController});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // final _con = Get.put(OnboardingScreenController());

  @override
  void initState() {
    super.initState();
    widget.videoController.play();
  }

  @override
  void dispose() {
    widget.videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: ClipRRect(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: widget.videoController.value.size.width,
                        height: widget.videoController.value.size.height,
                        child: VideoPlayer(widget.videoController),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Container(
            color: black.withValues(alpha: .4),
          )),
          Padding(
            padding: const EdgeInsets.all(AppDimentions.screenPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                CustomText.qText(
                  'Welcome To\nPink Paws',
                  size: 42,
                  weight: FontWeight.w700,
                  align: TextAlign.center,
                  color: fromHex('ee017c'),
                ),
                const Spacer(flex: 5),
                CustomText.pText(
                  'Connecting You With Your Perfect Kitten',
                  size: 28,
                  align: TextAlign.center,
                  color: white,
                ),
                const Spacer(flex: 5),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AppButton(
                    radius: 100,
                    text: 'View Available Kittens',
                    onTap: () => Get.off(() => const BottomNavScreen()),
                  ),
                ),
                heightSpace5
              ],
            ),
          )

          // PageView.builder(
          //   controller: _con.tabController,
          //   onPageChanged: (index) => _con.currentIndex(index),
          //   itemCount: _onboardingImages.length,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage(_onboardingImages[index]),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          // Positioned(
          //   bottom: 30,
          //   left: 20,
          //   right: 20,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Obx(
          //         () => Row(
          //           children: List.generate(
          //             _onboardingImages.length,
          //             (dotIndex) => Container(
          //               margin: const EdgeInsets.symmetric(horizontal: 4),
          //               width: _con.currentIndex.value == dotIndex ? 18 : 18,
          //               height: 8,
          //               decoration: BoxDecoration(
          //                   color: _con.currentIndex.value == dotIndex
          //                       ? ColorConstants.indictorColor
          //                       : Colors.white54,
          //                   borderRadius: BorderRadius.circular(4),
          //                   border: Border.all(
          //                     color: _con.currentIndex.value == dotIndex
          //                         ? ColorConstants.indictorColor
          //                         : Colors.grey,
          //                   )),
          //             ),
          //           ),
          //         ),
          //       ),
          //       widthSpace100,
          //       Expanded(
          //         child: AppButton(
          //           height: 60,
          //           text: 'Next',
          //           radius: 50,
          //           suffix: [
          //             widthSpace15,
          //             Image.asset(height: 18, width: 18, Images.arrowRightIcon)
          //           ],
          //           onTap: () {
          //             if (_con.currentIndex.value <
          //                 _onboardingImages.length - 1) {
          //               _con.tabController.nextPage(
          //                 duration: const Duration(milliseconds: 400),
          //                 curve: Curves.easeInOut,
          //               );
          //             } else {
          //               Get.to(() => const GetStartedScreen());
          //             }
          //           },
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

// final List<String> _onboardingImages = [
//   Images.introImg1,
//   Images.introImg2,
//   Images.introImg3,
// ];
