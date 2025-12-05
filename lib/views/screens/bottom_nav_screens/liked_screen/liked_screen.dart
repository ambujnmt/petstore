import 'package:pinkpawscat/views/screens/bottom_nav_screens/liked_screen/like_screen_controller.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/liked_screen/widgets/fs_shimmer.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/liked_screen/widgets/ls_card_widget.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/profile_screen/profile_screen_controller.dart';

import '../../../../utils/app_imports.dart';
import '../profile_screen/widgets/goto_login_button.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen>
    with AutomaticKeepAliveClientMixin {
  final con = Get.put(LikedScreenController());

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppScaffold(
      appBar: customAppBar(title: 'Favorite', hideLeadign: true),
      body: (size) => Obx(
        () => con.isLoading.value
            ? const FsShimmer()
            : con.user.value == null
                ? AppRefreshIndicator(
                    onRefresh: con.refreshData,
                    error: false,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: Get.height * .5,
                        ),
                        gotoLoginButton(
                          onLoginSuccess: () {
                            con.refreshData();
                            Get.find<ProfileScreenController>().refreshData();
                          },
                        )
                      ],
                    ),
                  )
                : con.favPets.value == null
                    ? AppRefreshIndicator(
                        onRefresh: con.refreshData,
                        error: true,
                        message: 'Something went wrong.',
                      )
                    : AppRefreshIndicator(
                        onRefresh: con.refreshData,
                        error: con.favPets.value!.isEmpty,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          children: [
                            GridView.builder(
                              itemCount: con.favPets.value!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: .58),
                              itemBuilder: (context, index) {
                                final pet = con.favPets.value![index];
                                return LsCardWidget(pet: pet);
                              },
                            )
                          ],
                        ),
                      ),
      ),
    );
  }
}
