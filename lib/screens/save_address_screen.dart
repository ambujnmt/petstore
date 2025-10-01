import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/constants/color_constants.dart';
import 'package:pinkpawscat/utils/custom_text.dart';

class SaveAddressScreen extends StatefulWidget {
  const SaveAddressScreen({super.key});

  @override
  State<SaveAddressScreen> createState() => _SaveAddressScreenState();
}

class _SaveAddressScreenState extends State<SaveAddressScreen> {
  final customText = CustomText();

  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              width: screenWidth * 0.06,
              height: screenWidth * 0.06,
            ),
          ),
        ),
        title: customText.kText(
          'Save Address',
          screenWidth * 0.05,
          FontWeight.w700,
          const Color(0xff4e1c74),
          TextAlign.start,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.home),
                        SizedBox(width: screenWidth * 0.02),
                        customText.kText(
                          'Home',
                          screenWidth * 0.05,
                          FontWeight.w700,
                          Colors.black,
                          TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    customText.kPText(
                      '106, Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      screenWidth * 0.035,
                      FontWeight.w500,
                      Colors.black,
                      TextAlign.start,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: customText.kText(
                            'Edit',
                            screenWidth * 0.045,
                            FontWeight.w700,
                            ColorConstants.selctedColor,
                            TextAlign.start,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        GestureDetector(
                          onTap: () {},
                          child: customText.kText(
                            'Delete',
                            screenWidth * 0.045,
                            FontWeight.w700,
                            ColorConstants.deleteColor,
                            TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/addnew.png',
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
