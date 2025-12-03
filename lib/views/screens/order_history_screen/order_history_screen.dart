import 'package:pinkpawscat/views/screens/order_history_screen/order_details_screen/order_details_screen.dart';
import 'package:pinkpawscat/views/screens/order_history_screen/order_history_screen_controller.dart';
import '../../../utils/app_imports.dart';
import '../bottom_nav_screens/profile_screen/widgets/goto_login_button.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({super.key});

  final _con = Get.put(OrderHistoryScreenController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'Order History'),
      body: (size) => Obx(
        () => _con.user.value == null
            ? AppRefreshIndicator(
                onRefresh: () async {},
                error: false,
                child: ListView(
                  children: [
                    SizedBox(
                      height: Get.height * .7,
                    ),
                    gotoLoginButton()
                  ],
                ),
              )
            : ListView(
                padding: AppDimentions.defaultScreenPadding,
                children: [
                  heightSpace12,
                  ...List.generate(10, (i) {
                    return CustomContainer.lightContainer(
                      color: fromHex('f8f9fb'),
                      margin: const EdgeInsets.only(
                          bottom: AppDimentions.screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomText.qText(
                                  'Order #45678',
                                  size: 17,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              widthSpace10,
                              CustomText.pText(
                                'Delivered',
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                              widthSpace5,
                              customIconButton(
                                  padding: 0,
                                  imgIcon: Images.deliveredIcon,
                                  size: 15)
                            ],
                          ),
                          heightSpace5,
                          CustomText.pText(
                            '04 Sep 2025',
                            color: grey,
                            size: 12,
                            weight: FontWeight.w500,
                          ),
                          heightSpace10,
                          Row(
                            children: [
                              CustomContainer.lightContainer(
                                color: fromHex('f3e8ff'),
                                height: 25,
                                width: 25,
                                hideShadow: true,
                                radiusValue: AppDimentions.boxRadiusXXS,
                                paddingValue: AppDimentions.screenPaddingXXS,
                                child: Image.asset(Images.catEmoji),
                              ),
                              widthSpace10,
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText.pText('Ornella',
                                      color: grey,
                                      size: 10,
                                      weight: FontWeight.w500,
                                      lines: 1),
                                  CustomText.pText(
                                    'King, British Shorthair',
                                    size: 8,
                                    lines: 1,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ))
                            ],
                          ),
                          heightSpace10,
                          Row(
                            children: [
                              Expanded(
                                child: CustomText.qText(
                                  'Total',
                                  size: 12,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              widthSpace10,
                              CustomText.pText(
                                '\$ 1550.00',
                                color: ColorConstants.selectedColor,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                          heightSpace10,
                          Center(
                            child: AppButton(
                              text: 'View Details',
                              textSize: 18,
                              padding: const EdgeInsets.symmetric(
                                  vertical:
                                      AppDimentions.screenPaddingXXS * .8),
                              intrinsicHeight: true,
                              width: 200,
                              bgColorOpacity: .5,
                              onTap: () =>
                                  Get.to(() => const OrderDetailsScreen()),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  heightSpace70
                ],
              ),
      ),
    );
  }
}
