import 'package:pinkpawscat/views/screens/bottom_nav_screens/liked_screen/like_screen.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/menu_screen/menu_screen.dart';
import 'package:pinkpawscat/views/screens/bottom_nav_screens/profile_screen/profile.dart';
import '../utils/app_imports.dart';
import '../views/screens/bottom_nav_screens/home_screen/home_screen.dart';
import 'bottom_nav_bar_screen_controller.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final _con = Get.put(BottomNavBarScreenController());

  final List<Widget> _pages = const [
    HomeScreen(),
    MenuScreen(),
    LikeScreen(),
    ProfileScreen(),
  ];

  final gradient = ColorConstants.selectedGradient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () => IndexedStack(index: _con.currentIndex.value, children: _pages)),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Obx(
          () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_tabs.length, (index) {
                final item = _tabs[index];
                final isActive = _con.currentIndex.value == index;
                return InkWell(
                  onTap: () => _con.setIndex(index),
                  child: AnimatedContainer(
                    width: isActive ? 90 : 40,
                    height: 36,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: isActive
                          ? LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                  ColorConstants.selctedColor
                                      .withValues(alpha: .76),
                                  ColorConstants.deleteColor
                                      .withValues(alpha: .76),
                                ])
                          : null,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset(
                            height: 20,
                            width: 20,
                            item['icon']!,
                            color: isActive ? white : black,
                          ),
                        ),
                        if (isActive)
                          Flexible(
                            child: CustomText.pText(item['title']!,
                                textOverFlow: TextOverflow.fade,
                                lines: 1,
                                size: 13,
                                color: white),
                          )
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}

final _tabs = [
  {'title': 'Home', 'icon': Images.homeIcon},
  {'title': 'Menu', 'icon': Images.menuIcon},
  {'title': 'Liked', 'icon': Images.heartIcon},
  {'title': 'Profile', 'icon': Images.profileIcon},
];
