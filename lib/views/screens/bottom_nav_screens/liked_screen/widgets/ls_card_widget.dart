import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/widgets/hs_color_widget.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/liked_screen/like_screen_controller.dart';
import '../../../../../utils/app_imports.dart';

class LsCardWidget extends StatelessWidget {
  final PetModel pet;
  const LsCardWidget({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomContainer.lightContainer(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight * .5,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned.fill(
                    child: AppNetworkImage(
                      imageUrl: pet.image,
                      radiusValue: 0,
                    ),
                  ),
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
                          child: CustomText.pText(pet.gender,
                              color: ColorConstants.selectedColor, size: 10),
                        ),
                        widthSpace8,
                        CustomContainer.lightContainer(
                          radiusValue: 50,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: CustomText.pText('${pet.age} Years',
                              color: ColorConstants.deleteColor, size: 10),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: customIconButton(
                      size: 30,
                      iconSize: 22,
                      padding: 0,
                      bgColor: white,
                      iconColor: red,
                      icon: Icons.favorite,
                      onTap: () =>
                          Get.find<LikedScreenController>().toggleFavPet(pet),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText.qText(pet.name,
                                size: 15, weight: FontWeight.w700),
                          ),
                          Image.asset(
                              height: 12, width: 12, Images.locationPinIcon),
                          widthSpace5,
                          CustomText.pText('__km',
                              size: 10,
                              color: ColorConstants.kDarkGrey,
                              weight: FontWeight.w400)
                        ],
                      ),
                      heightSpace8,
                      CustomText.pText(pet.species,
                          size: 10, align: TextAlign.left),
                      heightSpace10,
                      Row(
                        children: [
                          ...hsColorDotWidget(pet.colorHex),
                          Expanded(
                              child: CustomText.pText(pet.color,
                                  lines: 1, size: 10)),
                          CustomText.pText('Details',
                              size: 11, color: ColorConstants.selectedColor)
                        ],
                      ),
                      const Spacer(flex: 2),
                      Row(
                        children: [
                          Expanded(
                            child: CustomText.qText('\$${pet.price}',
                                size: 12, color: ColorConstants.selectedColor),
                          ),
                          AppButton(
                            height: 20,
                            intrinsicWidth: true,
                            bgColorOpacity: .75,
                            text: 'Add To Cart',
                            onTap: () => AppToast.show('Coming soon!'),
                          )
                        ],
                      ),
                      const Spacer(flex: 1),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
