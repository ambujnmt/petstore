import '../utils/app_imports.dart';

class BottomNavBarScreenController extends GetxController {
  final currentIndex = 0.obs;

  void setIndex(int index) => currentIndex(index);
}
