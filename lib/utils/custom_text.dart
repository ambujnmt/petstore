import 'app_imports.dart';

class CustomText {
  static Text kLogoName() {
    return const Text(
      "Pinkpawsact",
      style: TextStyle(
        fontFamily: CustomFonts.quicksand,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  static Text qText(
    String hint, {
    double? size,
    FontWeight? weight,
    Color? color,
    TextAlign? align,
    TextOverflow? textOverFlow,
    int? lines,
  }) {
    return Text(
      hint,
      style: TextStyle(
        fontFamily: CustomFonts.quicksand,
        fontSize: size ?? 16,
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? black,
      ),
      textAlign: align ?? TextAlign.start,
      overflow: textOverFlow ?? TextOverflow.ellipsis,
      maxLines: lines ?? 2,
    );
  }

  static Text pText(
    String hint, {
    double? size,
    FontWeight? weight,
    Color? color,
    TextAlign? align,
    TextOverflow? textOverFlow,
    int? lines,
  }) {
    return Text(
      hint,
      style: TextStyle(
        fontFamily: CustomFonts.poppins,
        fontSize: size ?? 15,
        fontWeight: weight ?? FontWeight.w500,
        color: color,
      ),
      textAlign: align ?? TextAlign.start,
      overflow: textOverFlow ?? TextOverflow.ellipsis,
      maxLines: lines ?? 2,
    );
  }

  static TextStyle qTextStyle(
      {double? size, FontWeight? weight, Color? color}) {
    return TextStyle(
      fontFamily: CustomFonts.quicksand,
      fontSize: size,
      fontWeight: weight ?? FontWeight.w600,
      color: color,
    );
  }

  static TextStyle pTextStyle(
      {double? size, FontWeight? weight, Color? color}) {
    return TextStyle(
      fontFamily: CustomFonts.poppins,
      fontSize: size,
      fontWeight: weight ?? FontWeight.w500,
      color: color,
    );
  }
}

class CustomFonts {
  static const poppins = 'Poppins';
  static const quicksand = 'Quicksand';
}
