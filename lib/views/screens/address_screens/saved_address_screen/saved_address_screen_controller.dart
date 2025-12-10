import 'package:pinkpawscat/utils/app_imports.dart';

class SavedAddressScreenController extends GetxController {
  final user = Rxn<UserModel>(UserStorage.getUserData());

  final isLoading = true.obs;

  final addresses = Rxn<List<AddressModel>>();

  Future<void> deleteAddress(AddressModel address) async {
    if (!await AppDialog.confirm(
        message: 'Are you sure, you want to delete this address?')) {
      return;
    }
    AppToast.show('Coming soon!');
    return;
    // AppLoader.show();
    // final res = await ApiServices.post('/delete-address', payload: {
    //   // "address_id": addressId,
    // });
    // await AppLoader.close();
    // if (res != null) {
    //   refreshUserData();
    // }
  }

  Future<void> _getAddresses() async {
    final res = await ApiServices.get('/get-addresses');
    if (res != null) {
      addresses.value = (res['addresses'] as List)
          .map((e) => AddressModel.fromJson(e))
          .toList();
    }
  }

  Future<void> refreshUserData() async {
    isLoading(true);
    addresses.value = null;
    user.value = UserStorage.getUserData();
    if (user.value != null) {
      await _getAddresses();
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    refreshUserData();
  }
}
