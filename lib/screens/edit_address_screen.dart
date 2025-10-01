import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/constants/color_constants.dart';
import 'package:pinkpawscat/utils/custom_text.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final customText = CustomText();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            child: Image.asset(
              "assets/images/map.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            left: screenWidth * 0.03,
            right: screenWidth * 0.03,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    'assets/images/backbutton.png',
                    width: screenWidth * 0.09,
                    height: screenWidth * 0.09,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: screenHeight * 0.06,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search For a building, street",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.27,
            left: screenWidth * 0.10,
            right: screenWidth * 0.10,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.012,
                    horizontal: screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.pink, width: 1.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.my_location,
                        color: Colors.pink, size: screenWidth * 0.05),
                    SizedBox(width: screenWidth * 0.02),
                    customText.kText('Use Current Location', screenWidth * 0.04,
                        FontWeight.w600, ColorConstants.selctedColor, TextAlign.start)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.red, size: screenWidth * 0.06),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child:
                        customText.kText("Lorem Ipsum", screenWidth * 0.045, FontWeight.w500, ColorConstants.kBlack, TextAlign.start)
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.01,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child:
                        customText.kPText('Change Location', 12, FontWeight.w500, Colors.black, TextAlign.start)
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  customText.kPText('106, Lorem Ipsum is simply dummy text of the printing and type setting industry.', 12, FontWeight.w600, Colors.black, TextAlign.start),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset('assets/images/confirmbtn.png')
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
