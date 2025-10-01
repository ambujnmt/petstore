import 'package:flutter/material.dart';
import 'package:advanced_salomon_bottom_bar/advanced_salomon_bottom_bar.dart';
import 'package:pinkpawscat/constants/color_constants.dart';
import 'package:pinkpawscat/screens/HomeScreen.dart';
import 'package:pinkpawscat/screens/like_screen.dart';
import 'package:pinkpawscat/screens/menu_screen.dart';
import 'package:pinkpawscat/screens/profile.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  var _currentIndex = 0;

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
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: AdvancedSalomonBottomBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            AdvancedSalomonBottomBarItem(
              icon: _buildGradientIcon(
                  "assets/images/home.png", _currentIndex == 0),
              title: _buildGradientText("Home", _currentIndex == 0),
              selectedColor: const Color(0xFFEE017C),
            ),
            AdvancedSalomonBottomBarItem(
              icon: _buildGradientIcon(
                  "assets/images/menu.png", _currentIndex == 1),
              title: _buildGradientText("Menu", _currentIndex == 1),
              selectedColor: Color(0xFFEE017C),
            ),
            AdvancedSalomonBottomBarItem(
              icon: _buildGradientIcon(
                  "assets/images/heart.png", _currentIndex == 2),
              title: _buildGradientText("Like", _currentIndex == 2),
              selectedColor: Color(0xFFEE017C),
            ),
            AdvancedSalomonBottomBarItem(
              icon: _buildGradientIcon(
                  "assets/images/profile.png", _currentIndex == 3),
              title: _buildGradientText("Profile", _currentIndex == 3),
              selectedColor: Color(0xFFEE017C),
            ),
          ],
        ),
      ),
    );
  }
}
