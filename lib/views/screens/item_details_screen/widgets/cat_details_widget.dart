import '../../../../utils/app_imports.dart';
import 'gender_widget.dart';

Widget catDetailsWidget() {
  return CustomContainer.lightContainer(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      heightSpace2,
      Row(
        children: [
          Expanded(
            child: CustomText.qText('Ornella',
                size: 30,
                weight: FontWeight.w700,
                color: ColorConstants.deleteColor),
          ),
          CustomText.pText('\$2450.00',
              size: 20, color: ColorConstants.selectedColor)
        ],
      ),
      heightSpace7,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 12,
            color: fromHex('b45309'),
          ),
          widthSpace10,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.pText('Black Golden Shaded', size: 14),
              CustomText.pText('DOB: 03/29/2025', size: 14),
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
        'Ornella is a stunning Queen, British Longhair with a gentle and affectionate personality. She loves spending time in cozy corners and enjoys being around people and other pets. Calm yet playful, Ornella adapts easily to family environments, making her a perfect companion. Her elegant appearance and loving nature bring warmth, joy, and charm to any household.',
      ),
      heightSpace10,
    ]),
  );
}
