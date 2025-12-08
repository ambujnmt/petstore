import '../../../../utils/app_imports.dart';

class HomeScreenController extends GetxController {
  final isError = false.obs;

  final categories = Rxn<List<CategoryModel>>();
  final pets = Rxn<List<PetModel>>();
  final featuredPet = Rxn<PetModel>();

  Future<void> _getPets() async {
    pets.value = null;
    final res = await ApiServices.get('/pets');
    if (res != null) {
      pets.value =
          (res['pets'] as List).map((p) => PetModel.fromJson(p)).toList();
      return;
    }
    isError(true);
  }

  Future<void> _getCategories() async {
    categories.value = null;
    final res = await ApiServices.get('/pet-categories');
    if (res != null) {
      categories.value = (res['categories'] as List)
          .map((c) => CategoryModel.fromJson(c))
          .toList();
      return;
    }
    isError(true);
  }

  Future<void> _getFeaturedPet() async {
    featuredPet.value = null;
    final res = await ApiServices.get('/featured-pets');
    if (res != null) {
      featuredPet.value =
          PetModel.fromJson((res['featuredPets'] as List).first);
      return;
    }
    isError(true);
  }

  Future<void> refreshData() async {
    isError(false);
    _getCategories();
    _getFeaturedPet();
    _getPets();
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
