import '../../../../utils/app_imports.dart';
import '../item_details_screen_controller.dart';

Widget genderWidget() {
  final con = Get.find<PetDetailsScreenController>();
  return Row(
    children: [
      buildGenderItem(
          icon: Images.genderIcon,
          color: fromHex('ffe5e0'),
          text1: 'Gender',
          text2: con.petData.value!.gender),
      buildGenderItem(
          icon: Images.calendarIcon,
          color: fromHex('e0fff4'),
          text1: 'Age',
          text2: '${con.petData.value!.age} Year'),
      buildGenderItem(
          icon: Images.tagicon,
          color: fromHex('ffe5e0'),
          text1: 'Braed',
          text2: con.petData.value!.species)
    ],
  );
}

Widget buildGenderItem({
  required String icon,
  required Color color,
  required String text1,
  required String text2,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customIconButton(imgIcon: icon, size: 37, bgColor: color),
          heightSpace5,
          CustomText.pText(text1,
              size: 12,
              color: ColorConstants.kDarkGrey,
              align: TextAlign.center),
          CustomText.pText(text2, size: 14, align: TextAlign.center)
        ],
      ),
    ),
  );
}
