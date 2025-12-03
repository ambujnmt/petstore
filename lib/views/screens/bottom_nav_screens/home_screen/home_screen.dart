import 'package:pinkpawscat/views/screens/bottom_nav_screens/home_screen/home_screen_controller.dart';
import 'package:pinkpawscat/views/widgets/app_sliver_appbar.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../utils/app_imports.dart';
import 'widgets/card_view.dart';
import '../../item_details_screen/item_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final con = Get.put(HomeScreenController());

  final List<Map<String, String>> categories = [
    {"image": "assets/images/cat1.png", "name": "Munchkin"},
    {"image": "assets/images/cat2.png", "name": "Ragdoll"},
    {"image": "assets/images/cat3.png", "name": "Persian"},
    {"image": "assets/images/cat4.png", "name": "Caracal"},
    {"image": "assets/images/cat5.png", "name": "British\nShorthair"},
  ];

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppSliverAppbar(
      onRefresh: con.refreshData,
      body: Padding(
        padding: AppDimentions.defaultScreenPadding,
        child: Obx(
          () => Skeletonizer(
            enabled: con.isLoading.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.pink, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/images/filtterbtn.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText.qText(
                  'Category',
                  size: 20,
                  weight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CustomText.pText(
                      'Find your perfect companion',
                      size: 12,
                      color: Colors.grey.shade400,
                    ),
                    const Spacer(),
                    CustomText.pText(
                      'View all',
                      size: 10,
                      color: Colors.grey.shade400,
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
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
                                  child: Image.asset(
                                    category["image"]!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            CustomText.pText(
                              category["name"]!,
                              size: 11,
                              align: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText.qText(
                  'Featured Pet',
                  size: 20,
                  weight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CustomText.pText(
                      'Find your perfect companion',
                      size: 12,
                      color: Colors.grey.shade400,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/viewbtn.png',
                        width: 60,
                        height: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => Get.to(() => ItemDetailsPage()),
                  child: const CatCard(),
                ),
                const SizedBox(height: 10),
                CustomText.qText(
                  'Pets Near You',
                  size: 20,
                  weight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                ),
                Row(
                  children: [
                    CustomText.pText(
                      'Find your perfect match',
                      size: 12,
                      color: Colors.grey.shade400,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/viewbtn.png',
                        width: 60,
                        height: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // const CartItemView()
                Center(
                  child: InteractiveViewer(
                    // zoom + scroll dono allow karega
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/item.png",
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width,
                            // Loader dikhane ke liye
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              if (wasSynchronouslyLoaded) {
                                return child;
                              }
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: frame != null
                                    ? child
                                    : const SizedBox(
                                        height: 300,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                heightSpace100
              ],
            ),
          ),
        ),
      ),
    );
  }
}
