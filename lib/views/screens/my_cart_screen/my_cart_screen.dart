import 'package:pinkpawscat/views/screens/order_summery_screen/order_summery_screen.dart';
import 'package:pinkpawscat/views/widgets/dotted_line_widget.dart';
import '../../../utils/app_imports.dart';

import 'my_cart_screen_controller.dart';

class MyCartScreen extends StatelessWidget {
  MyCartScreen({super.key});
  final _con = Get.put(MyCartScreenController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'My Cart'),
      body: (size) => Obx(
        () => AppRefreshIndicator(
          onRefresh: _con.refreshData,
          child: Skeletonizer(
            enabled: _con.isLoading.value,
            child: ListView(
              padding: AppDimentions.defaultScreenPadding,
              children: [
                heightSpace20,
                CustomContainer.darkContainer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer.lightContainer(
                        height: 125,
                        width: 125,
                        padding: EdgeInsets.zero,
                        border: Border.all(
                            color: fromHex('f3e8ff'),
                            strokeAlign: BorderSide.strokeAlignOutside),
                        child: Image.asset(
                            fit: BoxFit.cover, 'assets/images/fav-cat2.jpeg'),
                      ),
                      widthSpace10,
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.qText('Ornella',
                              size: 17, weight: FontWeight.bold),
                          heightSpace5,
                          CustomText.pText('Queen, British Longhair',
                              size: 12, color: grey[600]),
                          heightSpace12,
                          const AppButton(
                            height: 25,
                            intrinsicWidth: true,
                            bgColorOpacity: .55,
                            text: 'Ready for adoption',
                          ),
                          heightSpace12,
                          Row(
                            children: [
                              Expanded(
                                child: CustomText.pText('\$1550.00',
                                    size: 14,
                                    color: ColorConstants.selectedColor),
                              ),
                              widthSpace10,
                              CustomContainer.lightContainer(
                                border: Border.all(color: grey),
                                hideShadow: true,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimentions.screenPaddingXXS),
                                radiusValue: 50,
                                child: Row(
                                  children: [
                                    customIconButton(
                                      size: 17,
                                      bgColor: transparent,
                                      imgIcon: Images.minusIcon,
                                      onTap: () {},
                                    ),
                                    widthSpace10,
                                    CustomText.qText('1'),
                                    widthSpace10,
                                    customIconButton(
                                      size: 17,
                                      bgColor: transparent,
                                      imgIcon: Images.plusIcon,
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              widthSpace10,
                              customIconButton(
                                size: 25,
                                bgColor: transparent,
                                imgIcon: Images.deleteIcon,
                                onTap: () {},
                              ),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                heightSpace20,
                CustomContainer.darkContainer(
                    child: Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        maxLines: 1,
                        textSize: 18,
                        bottomPadding: 0,
                        hintText: 'Coupon code',
                        padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: AppDimentions.screenPaddingXXS),
                      ),
                    ),
                    widthSpace10,
                    AppButton(
                      radius: AppDimentions.boxRadiusS,
                      intrinsicWidth: true,
                      text: 'Apply Coupon',
                      bgColorOpacity: .55,
                      textSize: 12,
                      onTap: () => AppToast.show('Coming soon.'),
                    )
                  ],
                )),
                heightSpace20,
                CustomContainer.darkContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.pText('Summary', size: 16),
                      heightSpace20,
                      Row(
                        children: [
                          CustomText.pText(
                            'Subtotal',
                            size: 14,
                            weight: FontWeight.w400,
                            color: grey[600],
                          ),
                          Expanded(
                            child: CustomText.pText(
                              '\$1550.00',
                              size: 14,
                              weight: FontWeight.w400,
                              align: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      heightSpace20,
                      Row(
                        children: [
                          CustomText.pText(
                            'Delivery',
                            size: 14,
                            weight: FontWeight.w400,
                            color: grey[600],
                          ),
                          Expanded(
                            child: CustomText.pText(
                              'Free',
                              size: 14,
                              weight: FontWeight.w400,
                              align: TextAlign.right,
                              color: green,
                            ),
                          ),
                        ],
                      ),
                      heightSpace25,
                      CustomContainer.darkContainer(
                        width: Get.width,
                        child: CustomText.pText(
                          'Adoption fees help cover vaccinations, microchipping, and initial veterinary care.',
                          size: 12,
                          weight: FontWeight.w400,
                          color: blue,
                        ),
                      ),
                      heightSpace20,
                      const DottedLine(),
                      heightSpace10,
                      Row(
                        children: [
                          CustomText.pText(
                            'Total',
                            size: 14,
                            weight: FontWeight.w600,
                          ),
                          Expanded(
                            child: CustomText.pText(
                              '\$155.65',
                              size: 16,
                              weight: FontWeight.w700,
                              align: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                heightSpace70
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
          child: Padding(
        padding:
            AppDimentions.defaultScreenPadding.copyWith(bottom: 15, top: 10),
        child: AppButton(
          text: 'Proceed to chekout',
          onTap: () => Get.to(() => const OrderSummeryScreen()),
        ),
      )),
    );
  }
}
