import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/home_screen_controller.dart';
import 'package:pinkpawscat/views/screens/item_details_screen/item_details_screen_controller.dart';

import '../../../../utils/app_imports.dart';
import '../../bottom_nav_screens/home_screen/widgets/pets_near_you_widget.dart';

Widget recommendedWidget() {
  final con = Get.find<PetDetailsScreenController>();
  final petList = pickRandomItems<PetModel>(
      Get.find<HomeScreenController>().pets.value, 10);
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
            children: List.generate(petList.length, (index) {
              final pet = petList[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SizedBox(
                  height: 285,
                  width: 166,
                  child: HsGridCardWidget(
                    pet: pet,
                    onTap: () => con.loadNewPet(pet),
                  ),
                ),
              );
            }),
          ),
        ),
      )
    ],
  );
}

List<T> pickRandomItems<T>(List<T>? list, int count) {
  // null or empty list
  if (list == null || list.isEmpty) return [];

  // if list has less items than requested → return all items shuffled
  if (list.length <= count) {
    return List<T>.from(list)..shuffle();
  }

  // normal case → shuffle + return first N items
  List<T> copy = List<T>.from(list);
  copy.shuffle();
  return copy.take(count).toList();
}
