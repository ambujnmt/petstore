import '../../../../utils/app_imports.dart';

Widget personalityWidget() {
  return CustomContainer.lightContainer(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText.qText('Personality',
          size: 20, weight: FontWeight.w700, color: ColorConstants.deleteColor),
      heightSpace5,
      MediaQuery.removePadding(
        context: Get.context!,
        removeTop: true,
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2.5),
          children: List.generate(_persList.length, (index) {
            final item = _persList[index];
            return Row(
              children: [
                customIconButton(
                    size: 38,
                    hideShadow: false,
                    bgColor: white,
                    imgIcon: item['icon']),
                widthSpace10,
                Expanded(child: CustomText.pText(item['title']!, size: 14))
              ],
            );
          }),
        ),
      )
    ],
  ));
}

final _persList = [
  {'title': 'Friendly', 'icon': Images.friendlyIcon},
  {'title': 'Energetic', 'icon': Images.flashIcon},
  {'title': 'Loyal', 'icon': Images.blackHeartIcon},
  {'title': 'Playful', 'icon': Images.greenBallIcon},
];
