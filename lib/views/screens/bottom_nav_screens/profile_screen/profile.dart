import '../../../../utils/app_imports.dart';
import 'package:pinkpawscat/views/screens/payment_methods_screen.dart';
import 'package:pinkpawscat/views/screens/about_us_screen.dart';
import 'package:pinkpawscat/views/screens/authorization/login_screen/login_screen.dart';
import 'package:pinkpawscat/views/screens/contact_us_screen.dart';
import 'package:pinkpawscat/views/screens/edit_address_screen/edit_address_screen.dart';
import 'package:pinkpawscat/views/screens/faq_screen.dart';
import '../../save_address_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: height * 0.04),
          child: Column(
            children: [
              CustomContainer.lightContainer(
                shape: BoxShape.circle,
                padding: EdgeInsets.zero,
                child: CircleAvatar(
                  radius: width * 0.18,
                  backgroundImage: const NetworkImage(
                    "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomText.qText(
                "John Doe",
                size: width * 0.055,
                weight: FontWeight.w700,
                color: const Color(0xff4e1c74),
              ),
              CustomText.qText(
                "johndoe@gmail.com",
                size: width * 0.04,
                weight: FontWeight.w700,
              ),
              SizedBox(height: height * 0.015),
              AppButton(
                text: 'Edit Profile',
                intrinsicWidth: true,
                bgColorOpacity: .73,
                height: 34,
                suffix: [Image.asset(Images.editIcon, height: 16, width: 16)],
                onTap: () => Get.to(() => const EditAddressScreen()),
              ),
              SizedBox(height: height * 0.04),
              _buildMenuItem(imgIcon: Images.locationPinIcon1, "Save Address",
                  () {
                Get.to(() => const SaveAddressScreen());
              }),
              _buildMenuItem(imgIcon: Images.cardIcon, "Payment Methods", () {
                Get.to(() => const PaymentMethodsScreen());
              }),
              _buildMenuItem(imgIcon: Images.infoIcon, "About Us", () {
                Get.to(() => const AboutUsScreen());
              }),
              _buildMenuItem(imgIcon: Images.faqsIcon, "FAQs", () {
                Get.to(() => const FaqScreen());
              }),
              _buildMenuItem(imgIcon: Images.supportIcon, "Contact Us", () {
                Get.to(() => const ContactUsScreen());
              }),
              _buildMenuItem(icon: Icons.power_settings_new, "Logout",
                  () async {
                if (!await AppDialog.confirm(
                    title: 'Logout!', message: 'Are you sure, logout?')) {
                  return;
                }
                await SharedPrefs.clear();
                Get.deleteAll(force: true);
                Get.offAll(() => LoginScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onTap,
      {String? imgIcon, IconData? icon}) {
    return CustomContainer.lightContainer(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        leading: imgIcon != null
            ? Image.asset(height: 25, width: 25, imgIcon, color: black)
            : Icon(icon, size: 26, color: Colors.black),
        title: CustomText.pText(title, size: 16),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
