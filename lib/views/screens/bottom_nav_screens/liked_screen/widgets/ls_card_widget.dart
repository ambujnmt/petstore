import '../../../../../utils/app_imports.dart';

class LsCardWidget extends StatelessWidget {
  final Map item;
  const LsCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomContainer.lightContainer(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
                height: constraints.maxHeight * .5,
                width: constraints.maxWidth,
                fit: BoxFit.cover,
                item['img']!),
            Column(
              children: [
                SizedBox(height: (constraints.maxHeight * .5) - 40),
                Container(
                  height: 40,
                  color: black.withValues(alpha: .3),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      CustomContainer.lightContainer(
                          radiusValue: 50,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 9),
                          child: CustomText.pText(item['gender']!,
                              color: ColorConstants.selectedColor, size: 10)),
                      widthSpace8,
                      CustomContainer.lightContainer(
                          radiusValue: 50,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: CustomText.pText(item['age']!,
                              color: ColorConstants.deleteColor, size: 10))
                    ],
                  ),
                ),
                heightSpace10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText.qText(item['title'],
                                size: 15, weight: FontWeight.w700),
                            const Spacer(),
                            Image.asset(
                                height: 12, width: 12, Images.locationPinIcon),
                            widthSpace5,
                            CustomText.pText(item['distance'],
                                size: 10,
                                color: ColorConstants.kDarkGrey,
                                weight: FontWeight.w400)
                          ],
                        ),
                        heightSpace8,
                        CustomText.pText(item['desc'],
                            size: 10, align: TextAlign.left),
                        heightSpace20,
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: fromHex('d2691e'),
                              size: 14,
                            ),
                            widthSpace3,
                            Expanded(
                                child: CustomText.pText(item['tag'],
                                    lines: 1, size: 10)),
                            InkWell(
                                onTap: () => AppToast.show('Coming soon!'),
                                child: CustomText.pText('Details',
                                    size: 11,
                                    color: ColorConstants.selectedColor))
                          ],
                        ),
                        heightSpace25,
                        Row(
                          children: [
                            CustomText.qText(item['rate'],
                                size: 12, color: ColorConstants.selectedColor),
                            const Spacer(),
                            AppButton(
                              height: 20,
                              intrinsicWidth: true,
                              bgColorOpacity: .75,
                              text: 'Add To Cart',
                              // textSize: 12,
                              onTap: () => AppToast.show('Coming soon!'),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
