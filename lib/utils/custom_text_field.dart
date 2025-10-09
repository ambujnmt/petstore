import 'package:flutter/material.dart';
import 'package:pinkpawscat/utils/custom_text.dart';

import '../constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  final controller,
      textInputType,
      textInputAction,
      hint,
      isSuffixIcon,
      prefixIcon,
      suffixIcon,
      obsecureText;
  Function()? onSuffixTap;
  double horizontalPadding;
  bool readOnly;

  CustomTextField({
    super.key,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.hint,
    this.isSuffixIcon = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obsecureText = false,
    this.horizontalPadding = 0,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.065,
      width: width * 0.95,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: horizontalPadding),
      decoration: BoxDecoration(
        // color: ColorConstants.kPrimary,
        border: Border.all(color: ColorConstants.kLightGrey, width: 2),
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        obscureText: obsecureText,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        style: CustomText.qTextStyle(
            size: 20, weight: FontWeight.w400, color: ColorConstants.kDarkGrey),
        cursorColor: ColorConstants.kDarkGrey,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: const EdgeInsets.only(top: 5),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: CustomText.qTextStyle(
              size: 20,
              weight: FontWeight.w400,
              color: ColorConstants.kDarkGrey),
          // prefixIcon: prefixIcon,
          // suffixIcon: isSuffixIcon
          //     ? GestureDetector(
          //   child: suffixIcon,
          //   onTap: onSuffixTap,
          // )
          //     : const SizedBox(),
        ),
      ),
    );
  }
}
