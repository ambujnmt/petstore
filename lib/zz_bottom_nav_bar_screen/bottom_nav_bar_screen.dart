import 'package:advanced_salomon_bottom_bar/advanced_salomon_bottom_bar.dart';
import 'package:pinkpawscat/views/screens/like_screen.dart';
import 'package:pinkpawscat/views/screens/menu_screen.dart';
import 'package:pinkpawscat/views/screens/profile.dart';
import '../utils/app_imports.dart';
import '../views/screens/home_screen.dart';
import 'bottom_nav_bar_screen_controller.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final _con = Get.put(BottomNavBarScreenController());

  final List<Widget> _pages = const [
    HomeScreen(),
    MenuScreen(),
    LikeScreen(),
    ProfileScreen(),
  ];

  final gradient = ColorConstants.selectedGradient;

  Widget _buildGradientIcon(String asset, bool selected) {
    if (!selected) {
      return Image.asset(asset, width: 22, height: 22, color: Colors.black);
    }
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Image.asset(asset, width: 22, height: 22, color: Colors.white),
    );
  }

  Text _buildGradientText(String text, bool selected) {
    if (!selected) {
      return Text(text, style: const TextStyle(color: Colors.black));
    }
    return Text(
      text,
      style: TextStyle(
        foreground: Paint()
          ..shader = gradient.createShader(const Rect.fromLTWH(0, 0, 100, 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[_con.currentIndex.value]),
      bottomNavigationBar: Container(
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
          () => AdvancedSalomonBottomBar(
            backgroundColor: Colors.white,
            currentIndex: _con.currentIndex.value,
            onTap: _con.setIndex,
            items: List.generate(_tabs.length, (index) {
              final item = _tabs[index];
              return AdvancedSalomonBottomBarItem(
                icon: _buildGradientIcon(
                    item['icon']!, _con.currentIndex.value == 0),
                title: _buildGradientText(
                    item['title']!, _con.currentIndex.value == 0),
                selectedColor: const Color(0xFFEE017C),
              );
            }),
          ),
        ),
      ),
    );
  }
}

final _tabs = [
  {'title': 'Home', 'icon': "assets/images/home.png"},
  {'title': 'Menu', 'icon': "assets/images/menu.png"},
  {'title': 'Liked', 'icon': "assets/images/heart.png"},
  {'title': 'Profile', 'icon': "assets/images/profile.png"},
];
