import 'package:pinkpawscat/views/screens/item_details_screen/item_details_screen_controller.dart';

import '../../../../utils/app_imports.dart';
import 'gender_widget.dart';

Widget catDetailsWidget() {
  final con = Get.find<PetDetailsScreenController>();
  return CustomContainer.lightContainer(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      heightSpace2,
      Row(
        children: [
          Expanded(
            child: CustomText.qText(con.petData.value!.name,
                size: 30,
                weight: FontWeight.w700,
                color: ColorConstants.deleteColor),
          ),
          CustomText.pText('\$${con.petData.value!.price}',
              size: 20, color: ColorConstants.selectedColor)
        ],
      ),
      heightSpace7,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (con.petData.value!.colorHex.isNotEmpty) ...[
            CustomContainer.lightContainer(
              shape: BoxShape.circle,
              paddingValue: 0,
              child: Icon(
                Icons.circle,
                size: 13,
                color: fromHex(con.petData.value!.colorHex),
              ),
            ),
            widthSpace8,
          ],
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.pText(con.petData.value!.color, size: 14),
              CustomText.pText('DOB: __/__/____', size: 14),
            ],
          ))
        ],
      ),
      heightSpace15,
      genderWidget(),
      heightSpace20,
      CustomText.qText('About'),
      CustomText.pText(
        size: 12,
        lines: 30,
        weight: FontWeight.w400,
        con.petData.value!.description,
      ),
      heightSpace10,
    ]),
  );
}
