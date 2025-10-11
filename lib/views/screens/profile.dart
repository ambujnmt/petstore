import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/shared_prefs/shared_preferences.dart';
import 'package:pinkpawscat/views/screens/payment_methods_screen.dart';
import 'package:pinkpawscat/views/screens/about_us_screen.dart';
import 'package:pinkpawscat/views/screens/authorization/login_screen/login_screen.dart';
import 'package:pinkpawscat/views/screens/contact_us_screen.dart';
import 'package:pinkpawscat/views/screens/edit_address_screen.dart';
import 'package:pinkpawscat/views/screens/faq_screen.dart';
import 'package:pinkpawscat/utils/custom_text.dart';
import 'save_address_screen.dart';

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
              CircleAvatar(
                radius: width * 0.18,
                backgroundImage: const NetworkImage(
                  "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
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
              GestureDetector(
                onTap: () {
                  Get.to(() => const EditAddressScreen());
                },
                child: Image.asset(
                  'assets/images/editbtn.png',
                  width: 152,
                  height: 34,
                ),
              ),
              SizedBox(height: height * 0.04),
              buildMenuItem(Icons.location_on_outlined, "Save Address", () {
                Get.to(() => const SaveAddressScreen());
              }),
              buildMenuItem(Icons.credit_card, "Payment Methods", () {
                Get.to(() => const PaymentMethodsScreen());
              }),
              buildMenuItem(Icons.info_outline, "About Us", () {
                Get.to(() => const AboutUsScreen());
              }),
              buildMenuItem(Icons.help_outline, "FAQs", () {
                Get.to(() => const FaqScreen());
              }),
              buildMenuItem(Icons.support_agent, "Contact Us", () {
                Get.to(() => const ContactUsScreen());
              }),
              buildMenuItem(Icons.support_agent, "Logout", () async {
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

  Widget buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, size: 26, color: Colors.black),
        title: CustomText.pText(title, size: 14),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
