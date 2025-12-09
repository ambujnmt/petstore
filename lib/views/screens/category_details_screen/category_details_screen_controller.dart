import '../../../utils/app_imports.dart';

class CategoryDetailsScreenController extends GetxController {
  final CategoryModel category;
  CategoryDetailsScreenController({required this.category});

  final isLoading = true.obs;
  final pets = Rxn<List<PetModel>>();

  Future<void> _getPetsByCategory() async {
    final res = await ApiServices.get('/pets?category=${category.id}');
    if (res != null) {
      pets.value =
          (res['pets'] as List).map((p) => PetModel.fromJson(p)).toList();
      return;
    }
  }

  Future<void> refreshData() async {
    isLoading(true);
    pets.value = null;
    await _getPetsByCategory();
    isLoading(false);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   refreshData();
  // }
}
