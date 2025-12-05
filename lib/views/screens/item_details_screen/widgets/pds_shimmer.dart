import '../../../../utils/app_imports.dart';
import 'gender_widget.dart';

class PdsShimmer extends StatelessWidget {
  const PdsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Skeletonizer(
            enabled: true,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const SizedBox(
                      height: 288,
                      child: AppNetworkImage(
                          imageUrl: 'item',
                          radiusValue: 0,
                          fit: BoxFit.cover,
                          width: double.infinity),
                    ),
                    customDotsIndicator(length: 4),
                    Positioned(
                      top: MediaQuery.of(Get.context!).padding.top,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(),
                            customIconButton(
                                bgColor: black.withValues(alpha: .1))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                heightSpace14,
                Padding(
                  padding: AppDimentions.defaultScreenPadding,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomContainer.lightContainer(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                        size: 20,
                                        color: ColorConstants.selectedColor)
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText.pText('Black Golden Shaded',
                                            size: 14),
                                        CustomText.pText('DOB: 03/29/2025',
                                            size: 14),
                                      ],
                                    ))
                                  ],
                                ),
                                heightSpace15,
                                Row(
                                  children: [
                                    buildGenderItem(
                                        icon: Images.genderIcon,
                                        color: fromHex('ffe5e0'),
                                        text1: 'Gender',
                                        text2: 'Female'),
                                    buildGenderItem(
                                        icon: Images.calendarIcon,
                                        color: fromHex('e0fff4'),
                                        text1: 'Age',
                                        text2: '1.5 Year'),
                                    buildGenderItem(
                                        icon: Images.tagicon,
                                        color: fromHex('ffe5e0'),
                                        text1: 'Braed',
                                        text2: 'British Longhair')
                                  ],
                                ),
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
                        ),
                        heightSpace25,
                        CustomContainer.lightContainer(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.qText('Ornella',
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
                                      iconColor: transparent,
                                    ),
                                    widthSpace10,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText.pText('Health Status',
                                              size: 12,
                                              color: ColorConstants.kDarkGrey),
                                          CustomText.pText('Excellent',
                                              size: 14),
                                        ],
                                      ),
                                    ),
                                    CustomText.qText('Verified')
                                  ],
                                ),
                                heightSpace20,
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      customIconButton(
                                        icon: Icons.verified_user_outlined,
                                        bgColor: fromHex('ffe5e0'),
                                        iconColor: transparent,
                                      ),
                                      widthSpace10,
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText.pText('Vaccination',
                                                  size: 12,
                                                  color:
                                                      ColorConstants.kDarkGrey),
                                              heightSpace10,
                                              Row(
                                                children: List.generate(
                                                  3,
                                                  (index) {
                                                    return CustomContainer
                                                        .lightContainer(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 10),
                                                            radiusValue: 100,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        13,
                                                                    vertical:
                                                                        4),
                                                            child: CustomText
                                                                .pText('hudash',
                                                                    size: 14));
                                                  },
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ]),
                                heightSpace10,
                              ]),
                        ),
                        heightSpace25,
                      ]),
                ),
                heightSpace100,
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(Get.context!).padding.top,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customIconButton(
                    onTap: Get.back,
                    icon: Icons.arrow_back,
                    iconColor: white,
                    border: Border.all(
                        color:
                            ColorConstants.splashColor.withValues(alpha: .6)),
                    bgColor: black.withValues(alpha: .1)),
                const Spacer()
              ],
            ),
          ),
        )
      ],
    );
  }
}
