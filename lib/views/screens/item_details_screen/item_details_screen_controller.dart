import 'package:pinkpawscat/views/screens/bottom_nav_screens/liked_screen/like_screen_controller.dart';

import '../../../utils/app_imports.dart';

class PetDetailsScreenController extends GetxController {
  PetModel pet;
  PetDetailsScreenController({required this.pet});
  final user = Rxn<UserModel>(UserStorage.getUserData());
  final lc = Get.find<LikedScreenController>();

  final isFav = false.obs;
  final imageIndex = 0.obs;
  final isLoading = true.obs;

  final petData = Rxn<PetModel>();

  Future<void> _getPetDetails() async {
    petData.value = null;
    final res = await ApiServices.get('/pet/${pet.id}');
    if (res != null) {
      petData.value = PetModel.fromJson(res['pet']);
      _checkFav();
    }
  }

  Future<bool> toggleFavPet(PetModel pet) async {
    isFav.toggle();
    lc.favPets.value = lc.favPets.value ?? [];
    if (isFav.value) {
      lc.favPets.value!.add(pet);
    } else {
      lc.favPets.value!.removeWhere((t) => t.id == pet.id);
    }
    lc.favPets.refresh();
    final res =
        await ApiServices.post('/toggle-favorite', payload: {'pet_id': pet.id});
    if (res == null) {
      if (isFav.value) {
        lc.favPets.value!.removeWhere((t) => t.id == pet.id);
      } else {
        lc.favPets.value!.add(pet);
      }
      lc.favPets.refresh();
      isFav.toggle();
      return false;
    }
    return true;
  }

  void _checkFav() {
    if (lc.favPets.value == null || lc.favPets.value!.isEmpty) {
      return;
    }
    if (lc.favPets.value!.any((t) => t.id == pet.id)) {
      isFav(true);
    }
  }

  Future<void> refreshData() async {
    isLoading(true);
    await _getPetDetails();
    isLoading(false);
  }

  void loadNewPet(PetModel newPet) {
    pet = newPet;
    refreshData();
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
