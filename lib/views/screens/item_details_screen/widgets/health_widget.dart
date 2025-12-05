import '../../../../utils/app_imports.dart';
import '../item_details_screen_controller.dart';

class HealthWidget extends StatelessWidget {
  HealthWidget({super.key});
  final con = Get.find<PetDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return CustomContainer.lightContainer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText.qText(con.petData.value!.name,
            size: 20,
            weight: FontWeight.w700,
            color: ColorConstants.deleteColor),
        heightSpace18,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customIconButton(
              icon: Icons.health_and_safety_outlined,
              bgColor: fromHex('e0fff4'),
              iconColor: green,
            ),
            widthSpace10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.pText('Health Status',
                      size: 12, color: ColorConstants.kDarkGrey),
                  CustomText.pText('Excellent', size: 14),
                ],
              ),
            ),
            const AppButton(
              intrinsicWidth: true,
              height: 28,
              text: 'Verified',
              bgColorOpacity: .75,
              padding: EdgeInsets.symmetric(horizontal: 18),
            )
          ],
        ),
        heightSpace20,
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          customIconButton(
            icon: Icons.verified_user_outlined,
            bgColor: fromHex('ffe5e0'),
            iconColor: ColorConstants.selectedColor,
          ),
          widthSpace10,
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText.pText('Vaccination',
                  size: 12, color: ColorConstants.kDarkGrey),
              heightSpace10,
              Row(
                children: List.generate(
                  _vacList.length,
                  (index) {
                    return CustomContainer.lightContainer(
                        margin: const EdgeInsets.only(right: 10),
                        radiusValue: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 4),
                        child: CustomText.pText(_vacList[index], size: 14));
                  },
                ),
              ),
            ]),
          ),
        ]),
        heightSpace10,
      ]),
    );
  }
}

final _vacList = ['Rabies', 'FVRCP', 'FeLV'];
