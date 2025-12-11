import 'package:pinkpawscat/views/screens/bottom_nav_screens/liked_screen/like_screen_controller.dart';
import 'package:pinkpawscat/views/screens/update_profile_screen/update_profile_screen.dart';

import '../../../../utils/app_imports.dart';
import 'package:pinkpawscat/views/screens/payment_methods_screen/payment_methods_screen.dart';
import 'package:pinkpawscat/views/screens/about_us_screen/about_us_screen.dart';
import 'package:pinkpawscat/views/screens/contact_us_screen/contact_us_screen.dart';
import 'package:pinkpawscat/views/screens/faq_screen/faq_screen.dart';
import '../../order_history_screen/order_history_screen.dart';
import '../../address_screens/saved_address_screen/saved_address_screen.dart';
import 'profile_screen_controller.dart';
import 'widgets/goto_login_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  final con = Get.put(ProfileScreenController());
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          hideLeadign: true,
          title: '',
          bgColor: transparent,
          sftColor: transparent),
      extendBodyBehindAppBar: true,
      body: AppRefreshIndicator(
        onRefresh: con.refreshData,
        error: false,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: height * 0.04),
          child: Obx(
            () => Column(
              children: [
                heightSpace30,
                CustomContainer.lightContainer(
                  shape: BoxShape.circle,
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.zero,
                  child: AppNetworkImage(
                    imageUrl: '',
                    errorWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(height: 60, width: 60, Images.profileIcon),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                if (con.user.value != null) ...[
                  CustomText.qText(
                    con.user.value!.displayName,
                    size: width * 0.055,
                    weight: FontWeight.w700,
                    color: const Color(0xff4e1c74),
                  ),
                  CustomText.qText(
                    con.user.value!.email,
                    size: width * 0.04,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(height: height * 0.015),
                  AppButton(
                    text: 'Edit Profile',
                    intrinsicWidth: true,
                    bgColorOpacity: .73,
                    height: 34,
                    suffix: [
                      Image.asset(Images.editIcon, height: 16, width: 16)
                    ],
                    onTap: () => Get.to(() => UpdateProfileScreen()),
                  )
                ] else ...[
                  heightSpace20,
                  gotoLoginButton(
                    onLoginSuccess: () {
                      con.refreshData();
                      Get.find<LikedScreenController>().refreshData();
                    },
                  )
                ],
                SizedBox(height: height * 0.04),
                if (con.user.value != null) ...[
                  _buildMenuItem(
                      imgIcon: Images.cartIcon,
                      'Order History',
                      onTap: () => Get.to(() => OrderHistoryScreen())),
                  _buildMenuItem(
                      imgIcon: Images.locationPinIcon1,
                      "Save Address",
                      onTap: () => Get.to(() => const SaveAddressScreen())),
                  _buildMenuItem(
                      imgIcon: Images.cardIcon,
                      "Payment Methods",
                      onTap: () => Get.to(() => const PaymentMethodsScreen())),
                ],
                _buildMenuItem(
                    imgIcon: Images.infoIcon,
                    "About Us",
                    onTap: () => Get.to(() => const AboutUsScreen())),
                _buildMenuItem(
                    imgIcon: Images.faqsIcon,
                    "FAQs",
                    onTap: () => Get.to(() => const FaqScreen())),
                _buildMenuItem(
                    imgIcon: Images.supportIcon,
                    "Contact Us",
                    onTap: () => Get.to(() => ContactUsScreen())),
                if (con.user.value != null)
                  _buildMenuItem(icon: Icons.power_settings_new, "Logout",
                      onTap: () async {
                    final success = await UserController.logoutUser();
                    if (success) {
                      con.refreshData();
                      Get.find<LikedScreenController>().refreshData();
                    }
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title,
      {required VoidCallback onTap, String? imgIcon, IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: CustomContainer.lightContainer(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(
            vertical: AppDimentions.screenPaddingXXS),
        child: Padding(
          padding: const EdgeInsets.all(AppDimentions.screenPaddingS),
          child: Row(
            children: [
              imgIcon != null
                  ? Image.asset(height: 25, width: 25, imgIcon, color: black)
                  : Icon(icon, size: 26, color: Colors.black),
              widthSpace12,
              Expanded(child: CustomText.pText(title, size: 16)),
              widthSpace10,
              const Icon(Icons.arrow_forward_ios, size: 18)
            ],
          ),
        ),
      ),
    );
  }
}
