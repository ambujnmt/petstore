import 'package:pinkpawscat/utils/app_imports.dart';
import 'package:pinkpawscat/views/screens/address_screens/saved_address_screen/saved_address_screen_controller.dart';

class AddNewAddressScreenController extends GetxController {
  final houseController = TextEditingController();
  final apartmentController = TextEditingController();
  final localityController = TextEditingController();
  final mobileController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final directionController = TextEditingController();

  final houseError = ''.obs;
  final apartError = ''.obs;
  final localError = ''.obs;
  final mobileError = ''.obs;
  final stateError = ''.obs;
  final cityError = ''.obs;
  final zipError = ''.obs;
  final dirError = ''.obs;

  Future<void> onSubmit() async {
    if (!_validate()) return;

    closeKeyboard();

    if (!await AppDialog.confirm(
        message: 'Are you sure you want to save, this address?')) {
      return;
    }

    AppLoader.show();
    final res = await ApiServices.post('/save-address', payload: {
      "address": localityController.text,
      "flat_no": houseController.text,
      "area": apartmentController.text,
      "mobile": mobileController.text,
      "direction": directionController.text,
      "city": cityController.text,
      "state": stateController.text,
      "pincode": zipCodeController.text,
      "type": "home"
    });
    await AppLoader.close();
    if (res != null) {
      AppToast.success('Address saved');
      Get.find<SavedAddressScreenController>().refreshData();
      Get.back();
    }
  }

  bool _validate() {
    bool isValid = true;

    // House
    if (houseController.text.trim().isEmpty) {
      houseError.value = "House / Flat / Floor is required";
      isValid = false;
    } else {
      houseError.value = "";
    }

    // Apartment
    if (apartmentController.text.trim().isEmpty) {
      apartError.value = "Apartment / Road / Area is required";
      isValid = false;
    }

    // Locality
    if (localityController.text.trim().isEmpty) {
      localError.value = "Locality is required";
      isValid = false;
    }

    // Mobile
    String mobile = mobileController.text.trim();
    if (!GetUtils.isPhoneNumber(mobile)) {
      mobileError.value = "Mobile number is not valid";
      isValid = false;
    }

    // State
    if (stateController.text.trim().isEmpty) {
      stateError.value = "State is required";
      isValid = false;
    }

    // City
    if (cityController.text.trim().isEmpty) {
      cityError.value = "City is required";
      isValid = false;
    }

    // ZIP Code
    String zip = zipCodeController.text.trim();
    if (zip.isEmpty) {
      zipError.value = "Pincode is required";
      isValid = false;
    } else if (zip.length != 6 || !GetUtils.isNumericOnly(zip)) {
      zipError.value = "Enter valid 6-digit pincode";
      isValid = false;
    }

    // Direction
    if (directionController.text.trim().isEmpty) {
      dirError.value = "Direction is required";
      isValid = false;
    }

    return isValid;
  }
}
