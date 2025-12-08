import 'package:pinkpawscat/views/screens/bottom_nav_screens/menu_screen/widgets/ms_shimmer.dart';
import 'package:pinkpawscat/views/screens/category_details_screen/category_details_screen.dart';
import '../../../../utils/app_imports.dart';
import 'menu_screen_controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with AutomaticKeepAliveClientMixin {
  final con = Get.put(MenuScreenController());
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppScaffold(
      appBar: customAppBar(title: 'Category', hideLeadign: true),
      body: (_) => Obx(
        () => con.isLoding.value
            ? const MsShimmer()
            : AppRefreshIndicator(
                onRefresh: con.refreshData,
                error: con.categories.value == null,
                message: 'Something went wrong.',
                child: GridView.builder(
                  padding: AppDimentions.defaultScreenPadding,
                  itemCount: con.categories.value!.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .9,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final item = con.categories.value![index];
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () =>
                          Get.to(() => CategoryDetailsScreen(category: item)),
                      child: Column(
                        children: [
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) =>
                                  CustomContainer.lightContainer(
                                shape: BoxShape.circle,
                                padding: EdgeInsets.zero,
                                height: constraints.maxHeight,
                                width: constraints.maxHeight,
                                child: AppNetworkImage(imageUrl: item.image),
                              ),
                            ),
                          ),
                          heightSpace5,
                          CustomText.qText(item.name, size: 20)
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
