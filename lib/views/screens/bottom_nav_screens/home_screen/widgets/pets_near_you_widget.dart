import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/home_screen_controller.dart';
import 'package:pinkpawscat/views/screens/item_details_screen/item_details_screen.dart';
import '../../../../../utils/app_imports.dart';
import 'featured_card_widget.dart';

class PetsNearYouWidget extends StatelessWidget {
  PetsNearYouWidget({super.key});
  final _con = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hsHeadingWidget('Pets Near You', 'Find your perfect match'),
        heightSpace15,
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            itemCount: _con.pets.value!.length,
            shrinkWrap: true,
            padding: AppDimentions.defaultScreenPadding,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .6,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12),
            itemBuilder: (context, index) {
              final pet = _con.pets.value![index];
              return HsGridCardWidget(
                pet: pet,
              );
            },
          ),
        )
      ],
    );
  }
}

class HsGridCardWidget extends StatelessWidget {
  final PetModel pet;
  final VoidCallback? onTap;
  const HsGridCardWidget({super.key, required this.pet, this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomContainer.lightContainer(
        padding: EdgeInsets.zero,
        child: GestureDetector(
          onTap: onTap ?? () => Get.to(() => PetDetailsScreen(pet: pet)),
          child: Column(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight * .55,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: AppNetworkImage(
                        imageUrl: pet.image,
                        radiusValue: 0,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
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
                                    color: ColorConstants.selectedColor,
                                    size: 10)),
                            widthSpace8,
                            CustomContainer.lightContainer(
                                radiusValue: 50,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: CustomText.pText('${pet.age} Years',
                                    color: ColorConstants.deleteColor,
                                    size: 10))
                          ],
                        ),
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
                            Icon(
                              Icons.circle,
                              color: fromHex('d2691e'),
                              size: 14,
                            ),
                            widthSpace3,
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
                                  size: 12,
                                  color: ColorConstants.selectedColor),
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
      ),
    );
  }
}
