import 'package:pinkpawscat/views/screens/item_details_screen/widgets/image_widget.dart';
import 'package:pinkpawscat/views/screens/my_cart_screen/my_cart_screen.dart';
import '../../../utils/app_imports.dart';
import 'item_details_screen_controller.dart';
import 'widgets/cat_details_widget.dart';
import 'widgets/health_widget.dart';
import 'widgets/pds_shimmer.dart';
import 'widgets/personality_widget.dart';
import 'widgets/recommended_widget.dart';

class PetDetailsScreen extends StatelessWidget {
  final PetModel pet;
  const PetDetailsScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(PetDetailsScreenController(pet: pet));
    return Scaffold(
        body: Obx(
      () => con.isLoading.value
          ? const PdsShimmer()
          : AppRefreshIndicator(
              onRefresh: con.refreshData,
              error: con.petData.value == null,
              message: 'Something went wrong.',
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PdsImgSliderWidget(),
                    heightSpace14,
                    Padding(
                      padding: AppDimentions.defaultScreenPadding,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CatDetailsWidget(),
                            heightSpace25,
                            HealthWidget(),
                            heightSpace25,
                            PersonalityWidget(),
                            heightSpace25,
                            customCheckbox(
                                text:
                                    'I confirm I have read and agree to the Terms & Service'),
                            heightSpace25,
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    height: 40,
                                    text: 'Pay Deposit',
                                    bgColorOpacity: .75,
                                    onTap: () => AppToast.show('Coming soon!'),
                                  ),
                                ),
                                widthSpace15,
                                Expanded(
                                  child: AppButton(
                                    height: 40,
                                    transparent: true,
                                    text: 'Pay In Full',
                                    onTap: () => AppToast.show('Coming soon!'),
                                  ),
                                )
                              ],
                            ),
                            heightSpace8,
                            CustomText.qText('Pay a 25% deposit',
                                size: 10, color: ColorConstants.selectedColor),
                            heightSpace13,
                            CustomText.qText('Deposits are Non-Refundable',
                                size: 12, color: ColorConstants.kDarkGrey),
                            heightSpace30,
                            Center(
                              child: AppButton(
                                width: Get.width - 100,
                                height: 40,
                                text: 'Adopt Me Now',
                                onTap: () => Get.to(() => MyCartScreen()),
                              ),
                            ),
                          ]),
                    ),
                    heightSpace30,
                    recommendedWidget(),
                    heightSpace100
                  ],
                ),
              ),
            ),
    ));
  }
}
