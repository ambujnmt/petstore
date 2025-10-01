import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';
import '../utils/custom_text.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final customText = CustomText();
  String? selectedMethod = "Paytm";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(
              'assets/images/backbutton.png',
              width: 25,
              height: 25,
            ),
          ),
        ),
        title: customText.kText(
          'Select a Payment Method',
          20,
          FontWeight.w700,
          const Color(0xff4e1c74),
          TextAlign.start,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.03)),
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Row(
                  children: [
                    Icon(Icons.home, size: width * 0.08, color: Colors.black),
                    SizedBox(width: width * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText.kPText("Home", 20, FontWeight.bold,
                              Colors.black, TextAlign.start),
                          SizedBox(height: height * 0.005),
                          customText.kPText(
                              '106, Lorem Ipsum is simply dummy text of the printing and type setting industry.',
                              12,
                              FontWeight.w400,
                              Colors.black,
                              TextAlign.start),
                          SizedBox(height: height * 0.005),
                          customText.kPText("Phone No : 1234567890", 12,
                              FontWeight.w400, Colors.black, TextAlign.start)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: customText.kPText("View All", 15, FontWeight.w400,
                      Colors.black, TextAlign.start)),
            ),
            SizedBox(height: height * 0.015),
            customText.kPText("Recommended", 20, FontWeight.w400, Colors.black,
                TextAlign.start),
            SizedBox(height: height * 0.015),
            buildPaymentOption("Paytm", "HDFC Bank **0011", "assets/images/hdfc.png", width),
            buildPaymentOption("HDFC Bank Credit Card", "VISA **0011 | Sant Singh", "assets/images/hdfc.png", width),
            buildPaymentOption("Klarna", "", "assets/images/hdfc.png", width),
            buildPaymentOption("Affirm", "", "assets/images/hdfc.png", width),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: height * 0.07,
              child: Ink(
                child: Center(
                    child: Image.asset(
                  'assets/images/payno.png',
                  width: 360,
                  height: 50,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(String title, String subtitle, String imagePath, double width) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Row(
          children: [
            Radio<String>(
              activeColor: ColorConstants.selctedColor,
              value: title,
              groupValue: selectedMethod,
              onChanged: (val) {
                setState(() {
                  selectedMethod = val.toString();
                });
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText.kPText(
                      title, 14, FontWeight.w500, Colors.black, TextAlign.start),
                  if (subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: customText.kPText(
                          subtitle, 12, FontWeight.w400, Colors.black54, TextAlign.start),
                    ),
                ],
              ),
            ),
            if (imagePath.isNotEmpty)
              Image.asset(
                imagePath,
                width: width * 0.08,
                height: width * 0.08,
                fit: BoxFit.contain,
              ),
          ],
        ),
      ),
    );
  }
}
