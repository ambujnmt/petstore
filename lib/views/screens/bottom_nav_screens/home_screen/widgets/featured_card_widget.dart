import 'dart:math';

import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/home_screen_controller.dart';
import 'package:pinkpawscat/views/screens/item_details_screen/item_details_screen.dart';

import '../../../../../utils/app_imports.dart';
import 'hs_color_widget.dart';

class FeaturedPetCardWidget extends StatelessWidget {
  FeaturedPetCardWidget({super.key});
  final random = Random();
  final _con = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    final pet = _con.featuredPet.value;
    return pet == null
        ? const SizedBox()
        : Column(
            children: [
              hsHeadingWidget('Featured Pet', 'Special pet of the day'),
              heightSpace15,
              Padding(
                padding: AppDimentions.defaultScreenPadding,
                child: GestureDetector(
                  onTap: () => Get.to(() => PetDetailsScreen(pet: pet)),
                  child: CustomContainer.lightContainer(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            AppNetworkImage(
                              imageUrl: pet.image,
                              height: 192,
                              radiusValue: 0,
                              width: Get.width,
                            ),
                            const Positioned(
                              top: 13,
                              left: 10,
                              child: AppButton(
                                intrinsicWidth: true,
                                height: 20,
                                bgColorOpacity: .65,
                                text: 'Featured',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomText.qText(
                                      pet.name,
                                      size: 17,
                                      weight: FontWeight.w700,
                                      color: const Color(0xFF2C3E50),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText.pText(
                                        pet.gender,
                                        size: 10,
                                        color: const Color(0xFF4E1C74),
                                        align: TextAlign.center,
                                      ),
                                      widthSpace5,
                                      CustomText.pText(
                                        '${pet.age} Years',
                                        size: 10,
                                        color: const Color(0xFFEE017C),
                                        align: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              heightSpace16,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: CustomText.pText(
                                      pet.species,
                                      size: 12,
                                      color: const Color(0xFF4B5563),
                                    ),
                                  ),
                                  widthSpace10,
                                  CustomText.pText(
                                    '\$${pet.price.isEmpty ? '__' : pet.price}',
                                    size: 16,
                                    color: const Color(0xFFEE017C),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ...hsColorDotWidget(pet.colorHex),
                                  Expanded(
                                    child: CustomText.pText(
                                      pet.color,
                                      size: 12,
                                      color: const Color(0xFF4B5563),
                                    ),
                                  ),
                                  const AppButton(
                                    intrinsicWidth: true,
                                    height: 22,
                                    bgColorOpacity: .65,
                                    text: 'View Details',
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

Widget hsHeadingWidget(String title, String subTitle,
    {VoidCallback? onViewTap, Widget? trailing}) {
  return Padding(
    padding: AppDimentions.defaultScreenPadding,
    child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.qText(
              title,
              size: 20,
              weight: FontWeight.w700,
              color: const Color(0xFF1F2937),
            ),
            heightSpace5,
            CustomText.pText(
              subTitle,
              size: 12,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
      widthSpace5,
      trailing ??
          AppButton(
            height: 20,
            intrinsicWidth: true,
            text: 'View',
            spaceBetweenSuffix: const SizedBox(width: 0),
            bgColorOpacity: .65,
            suffix: const [
              Icon(
                Icons.keyboard_arrow_right,
                color: white,
                size: 18,
              )
            ],
            onTap: onViewTap ?? () => AppToast.show('Coming soon.'),
          ),
    ]),
  );
}
