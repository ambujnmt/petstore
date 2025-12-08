import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/home_screen_controller.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/widgets/featured_card_widget.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/menu_screen/menu_screen.dart';
import '../../../../../utils/app_imports.dart';
import '../../../category_details_screen/category_details_screen.dart';

class HsCategoryWidget extends StatelessWidget {
  HsCategoryWidget({super.key});
  final _con = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hsHeadingWidget(
          'Category',
          'Find your perfect companion',
          trailing: InkWell(
            onTap: () => Get.to(() => const MenuScreen()),
            child: CustomText.pText(
              'View all',
              size: 12,
              color: ColorConstants.selectedColor,
            ),
          ),
        ),
        heightSpace15,
        SizedBox(
          height: 132,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppDimentions.defaultScreenPadding,
            itemCount: _con.categories.value!.length,
            itemBuilder: (context, index) {
              final category = _con.categories.value![index];
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Get.to(
                  () => CategoryDetailsScreen(category: category),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipOval(
                          child: AppNetworkImage(imageUrl: category.image),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    CustomText.pText(
                      category.name,
                      size: 11,
                      weight: FontWeight.w600,
                      align: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => widthSpace10,
          ),
        ),
      ],
    );
  }
}
