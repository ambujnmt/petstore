import 'package:get/get.dart';
import 'package:pinkpawscat/services/api_services/api_services.dart';

class HomeScreenController extends GetxController {
  final isLoading = true.obs;

  Future<void> _getPets() async {
    final res = await ApiServices.get('/pets');
    if (res != null) {}
  }

  Future<void> refreshData() async {
    isLoading(true);
    await _getPets();
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
