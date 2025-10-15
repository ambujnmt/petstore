import '../../../../utils/app_imports.dart';

Widget recommendedWidget() {
  const maxHeight = 300.0;
  const maxWidth = 166.0;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: AppDimentions.defaultScreenPadding,
        child: CustomText.qText('Recommended',
            size: 20,
            weight: FontWeight.w700,
            color: ColorConstants.deleteColor),
      ),
      heightSpace7,
      IntrinsicHeight(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding:
              AppDimentions.defaultScreenPadding.copyWith(top: 10, bottom: 10),
          child: Row(
            children: List.generate(_favItems.length, (index) {
              final item = _favItems[index];
              return CustomContainer.lightContainer(
                width: maxWidth,
                height: maxHeight,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.only(
                    right: index == _favItems.length - 1 ? 0 : 15),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                        height: maxHeight * .5,
                        width: maxWidth,
                        fit: BoxFit.cover,
                        item['img']!),
                    Column(
                      children: [
                        const SizedBox(height: (maxHeight * .5) - 40),
                        Container(
                          height: 40,
                          color: black.withValues(alpha: .4),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              CustomContainer.lightContainer(
                                  radius: 50,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 9),
                                  child: CustomText.pText(item['gender']!,
                                      color: ColorConstants.selctedColor,
                                      size: 10)),
                              widthSpace8,
                              CustomContainer.lightContainer(
                                  radius: 50,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  child: CustomText.pText(item['age']!,
                                      color: ColorConstants.deleteColor,
                                      size: 10))
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
                                    CustomText.qText(item['title']!,
                                        size: 15, weight: FontWeight.w700),
                                    const Spacer(),
                                    Image.asset(
                                        height: 12,
                                        width: 12,
                                        Images.locationPinIcon),
                                    widthSpace5,
                                    CustomText.pText(item['distance']!,
                                        size: 10,
                                        color: ColorConstants.kDarkGrey,
                                        weight: FontWeight.w400)
                                  ],
                                ),
                                heightSpace8,
                                CustomText.pText(item['desc']!,
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
                                        child: CustomText.pText(item['tag']!,
                                            lines: 1, size: 10)),
                                    InkWell(
                                        onTap: () =>
                                            AppToast.show('Coming soon!'),
                                        child: CustomText.pText('Details',
                                            size: 11,
                                            color: ColorConstants.selctedColor))
                                  ],
                                ),
                                heightSpace25,
                                Row(
                                  children: [
                                    CustomText.qText(item['rate']!,
                                        size: 12,
                                        color: ColorConstants.selctedColor),
                                    const Spacer(),
                                    AppButton(
                                      height: 20,
                                      intrinsicWidth: true,
                                      bgColorOpacity: .75,
                                      text: 'Add To Cart',
                                      onTap: () =>
                                          AppToast.show('Coming soon!'),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      )
    ],
  );
}

final _favItems = [
  {
    'title': 'Emir',
    'desc': 'King, British Shorthair',
    'tag': 'Cinnamon',
    'rate': '\$1550',
    'img': 'assets/images/fav-cat1.jpg',
    'distance': '2.5 km',
    'gender': 'Male',
    'age': '2 years'
  },
  {
    'title': 'Pegas',
    'desc': 'King, British Shorthair',
    'tag': 'Black Golden Shell',
    'rate': '\$1850',
    'img': 'assets/images/fav-cat2.jpeg',
    'distance': '1.5 km',
    'gender': 'Male',
    'age': '3 years'
  },
  {
    'title': 'Leonette',
    'desc': 'Queen, British Shorthair',
    'tag': 'Blue',
    'rate': '\$2050',
    'img': 'assets/images/fav-cat2.jpeg',
    'distance': '4.3 km',
    'gender': 'Female',
    'age': '1.5 years'
  },
  {
    'title': 'Kylie',
    'desc': 'Queen, British Longhair',
    'tag': 'Black Silver Shaded',
    'rate': '\$2550',
    'img': 'assets/images/fav-cat1.jpg',
    'distance': '1.8 km',
    'gender': 'Female',
    'age': '3 years'
  },
];
