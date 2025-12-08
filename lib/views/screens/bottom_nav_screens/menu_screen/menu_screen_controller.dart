import '../../../../utils/app_imports.dart';

class MenuScreenController extends GetxController {
  final isLoding = true.obs;
  final categories = Rxn<List<CategoryModel>>();

  Future<void> _getCategories() async {
    final res = await ApiServices.get('/pet-categories');
    if (res != null) {
      categories.value = (res['categories'] as List)
          .map((c) => CategoryModel.fromJson(c))
          .toList();
      return;
    }
  }

  Future<void> refreshData() async {
    isLoding(true);
    categories.value = null;
    await _getCategories();
    isLoding(false);
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
