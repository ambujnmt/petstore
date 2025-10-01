import 'package:flutter/material.dart';

class CustomText {
  kLogoName() {
    return const Text(
      "Pinkpawsact",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: "QuickSandBold",
      ),
    );
  }
  kText(String hint, double fontSize, FontWeight fontWeight, Color color,
      TextAlign textAlign, [TextOverflow? textOverFlow, int? lines]) {
    return Text(
      hint,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: "QuickSandBold"),
      textAlign: textAlign,
      overflow: textOverFlow ?? TextOverflow.ellipsis,
      maxLines: lines ?? 2,
    );
  }

  kPText(String hint, double fontSize, FontWeight fontWeight, Color color,
      TextAlign textAlign, [TextOverflow? textOverFlow, int? lines]) {
    return Text(
      hint,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: "PoppinsMedium"),
      textAlign: textAlign,
      overflow: textOverFlow ?? TextOverflow.ellipsis,
      maxLines: lines ?? 2,
    );
  }

  kTextStyle(double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: "QuickSandBold");
  }
  kPTextStyle(double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: "PoppinsMedium");
  }

}