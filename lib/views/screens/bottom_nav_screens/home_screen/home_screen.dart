import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/home_screen_controller.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/widgets/hs_simmer.dart';
import 'package:pinkpawscat/views/widgets/app_sliver_appbar.dart';
import '../../../../utils/app_imports.dart';
import 'widgets/featured_card_widget.dart';
import 'widgets/hs_category_widget.dart';
import 'widgets/pets_near_you_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final con = Get.put(HomeScreenController());

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppSliverAppbar(
      onRefresh: con.refreshData,
      body: Obx(
        () => con.isError.value
            ? SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(height: Get.height * .2),
                    CustomText.qText('Something went wrong.'),
                  ],
                ),
              )
            : con.pets.value == null || con.categories.value == null
                ? const HsShimmer()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: AppDimentions.defaultScreenPadding,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey.shade400,
                                  ),
                                  hintText: "Search here",
                                  hintStyle: CustomText.pTextStyle(
                                      size: 16, color: Colors.grey.shade400),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                ),
                              ),
                            ),
                            widthSpace12,
                            customIconButton(
                                size: 45,
                                imgIcon: Images.filterIcon,
                                bgColor: ColorConstants.deleteColor),
                          ],
                        ),
                      ),
                      heightSpace15,
                      HsCategoryWidget(),
                      FeaturedPetCardWidget(),
                      heightSpace12,
                      PetsNearYouWidget(),
                      heightSpace100
                    ],
                  ),
      ),
    );
  }
}
