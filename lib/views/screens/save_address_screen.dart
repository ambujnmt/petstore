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
        title: CustomText.qText(
          'Save Address',
          size: screenWidth * 0.05,
          weight: FontWeight.w700,
          color: const Color(0xff4e1c74),
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
                        CustomText.qText(
                          'Home',
                          size: screenWidth * 0.05,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    CustomText.pText(
                      '106, Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      size: screenWidth * 0.035,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CustomText.qText(
                            'Edit',
                            size: screenWidth * 0.045,
                            weight: FontWeight.w700,
                            color: ColorConstants.selctedColor,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        GestureDetector(
                          onTap: () {},
                          child: CustomText.qText(
                            'Delete',
                            size: screenWidth * 0.045,
                            weight: FontWeight.w700,
                            color: ColorConstants.deleteColor,
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
