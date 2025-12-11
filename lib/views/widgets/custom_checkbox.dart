import 'package:pinkpawscat/utils/app_imports.dart';

Widget customCheckbox({
  RxBool? value,
  String? text,
  VoidCallback? onChanged,
}) {
  value ??= false.obs;
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => onChanged?.call(),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer.lightContainer(
          height: 20,
          width: 20,
          padding: EdgeInsets.zero,
          radiusValue: 2,
          child: Obx(
            () => Checkbox(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              value: value?.value,
              side: BorderSide.none,
              activeColor: ColorConstants.selectedColor,
              onChanged: (val) => onChanged?.call(),
            ),
          ),
        ),
        widthSpace10,
        Expanded(
          child: CustomText.pText(
              text ?? 'Confirm that you agree the terms and condition.',
              size: 12,
              weight: FontWeight.w400),
        )
      ],
    ),
  );
}
