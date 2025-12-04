import '../../../utils/app_imports.dart';

class PetDetailsScreenController extends GetxController {
  PetModel pet;
  PetDetailsScreenController({required this.pet});

  final imageIndex = 0.obs;
  final isLoading = true.obs;

  final petData = Rxn<PetModel>();

  Future<void> _getPetDetails() async {
    petData.value = null;
    final res = await ApiServices.get('/pet/${pet.id}');
    if (res != null) {
      petData.value = PetModel.fromJson((res['pets'] as List).first);
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
