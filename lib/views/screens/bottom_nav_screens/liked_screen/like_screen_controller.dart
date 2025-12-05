import 'package:pinkpawscat/utils/app_imports.dart';

class LikedScreenController extends GetxController {
  final isLoading = true.obs;

  final user = Rxn<UserModel>(UserStorage.getUserData());

  final favPets = Rxn<List<PetModel>>();

  Future<void> _getFavData() async {
    final res = await ApiServices.get('/favorites');
    if (res != null) {
      favPets.value = (res['favoritePets'] as List)
          .map((f) => PetModel.fromJson(f))
          .toList();
    }
  }

  Future<void> toggleFavPet(PetModel pet) async {
    if (favPets.value == null || favPets.value!.isEmpty) {
      return;
    }
    favPets.value!.removeWhere((t) => t.id == pet.id);
    favPets.refresh();
    final res =
        await ApiServices.post('/toggle-favorite', payload: {'pet_id': pet.id});
    if (res == null) {
      refreshData();
    }
  }

  Future<void> refreshData() async {
    isLoading(true);
    favPets.value = null;
    user.value = UserStorage.getUserData();
    if (user.value != null) {
      await _getFavData();
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
