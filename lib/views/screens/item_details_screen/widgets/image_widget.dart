import 'package:carousel_slider/carousel_slider.dart';
import 'package:pinkpawscat/views/screens/item_details_screen/item_details_screen_controller.dart';
import 'package:pinkpawscat/views/widgets/view_image.dart';
import '../../../../utils/app_imports.dart';

class PdsImgSliderWidget extends StatelessWidget {
  PdsImgSliderWidget({super.key});
  final con = Get.find<PetDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    final imgs = [con.petData.value!.image];
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 288,
          child: CarouselSlider(
            items: imgs
                .map(
                  (item) => GestureDetector(
                    onTap: () => Get.to(() => ViewImage(imgUrl: item),
                        transition: Transition.native),
                    child: Hero(
                      tag: item,
                      child: AppNetworkImage(
                        imageUrl: item,
                        width: double.infinity,
                        radiusValue: 0,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 288,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 6),
              onPageChanged: (index, reason) => con.imageIndex(index),
            ),
          ),
        ),
        Obx(
          () => customDotsIndicator(
              length: imgs.length, currentIndex: con.imageIndex.value),
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
                    padding: 0,
                    onTap: Get.back,
                    icon: Icons.arrow_back,
                    iconColor: white,
                    border: Border.all(
                        color:
                            ColorConstants.splashColor.withValues(alpha: .6)),
                    bgColor: black.withValues(alpha: .1)),
                Obx(
                  () => con.user.value == null
                      ? const SizedBox()
                      : customIconButton(
                          padding: 0,
                          iconSize: 26,
                          bgColor: black.withValues(alpha: .1),
                          iconColor: con.isFav.value ? red : white,
                          icon: con.isFav.value
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          border: Border.all(
                              color: ColorConstants.splashColor
                                  .withValues(alpha: .6)),
                          onTap: () => con.toggleFavPet(con.petData.value!),
                        ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
