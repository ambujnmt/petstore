import '../../../utils/app_imports.dart';

class ItemDetailsScreenController extends GetxController {
  final imageIndex = 0.obs;
  final isLoading = true.obs;
  String? test;

  Future<void> _getPetDetails() async {
    final res = await ApiServices.get('/pet/${'petId'}');
    if (res != null) {}
  }

  Future<void> refreshData() async {
    isLoading(true);
    await _getPetDetails();
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
