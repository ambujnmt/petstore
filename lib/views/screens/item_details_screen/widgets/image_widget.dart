import 'package:carousel_slider/carousel_slider.dart';
import 'package:pinkpawscat/views/screens/item_details_screen/item_details_screen_controller.dart';

import '../../../../utils/app_imports.dart';

Widget imageWidget() {
  final con = Get.find<ItemDetailsScreenController>();
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      SizedBox(
        height: 288,
        child: CarouselSlider(
          items: _imgList
              .map((item) =>
                  Image.asset(item, fit: BoxFit.cover, width: double.infinity))
              .toList(),
          options: CarouselOptions(
            height: 288,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) => con.imageIndex(index),
          ),
        ),
      ),
      Obx(
        () => customDotsIndicator(
            length: _imgList.length, currentIndex: con.imageIndex.value),
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
                      color: ColorConstants.splashColor.withValues(alpha: .6)),
                  bgColor: black.withValues(alpha: .1)),
              customIconButton(
                  icon: Icons.favorite_outline,
                  iconColor: white,
                  onTap: () => AppToast.show('Coming soon!'),
                  border: Border.all(
                      color: ColorConstants.splashColor.withValues(alpha: .6)),
                  bgColor: black.withValues(alpha: .1))
            ],
          ),
        ),
      )
    ],
  );
}

final _imgList = [
  'assets/images/cat-item-details.png',
  'assets/images/cat-item-details.png',
  'assets/images/cat-item-details.png',
  'assets/images/cat-item-details.png',
];
