import '../../../utils/app_imports.dart';

class MyCartScreenController extends GetxController {
  final isLoading = true.obs;

  Future<void> _getCartData() async {
    await waitForSec(1);
  }

  Future<void> refreshData() async {
    isLoading(true);
    await _getCartData();
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
