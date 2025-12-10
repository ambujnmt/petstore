import 'package:pinkpawscat/utils/app_imports.dart';

class AddNewAddressScreenController extends GetxController {
  Future<void> onSubmit() async {
    AppLoader.show();
    final res = await ApiServices.post('/save-address', payload: {
      "address": "Gaur City 2",
      "flat_no": "T16-305",
      "area": "Noida Extension",
      "mobile": "9876543210",
      "direction": "Near main gate",
      "city": "Noida",
      "state": "UP",
      "pincode": "201301",
      "type": "home"
    });
    AppLoader.close();
  }
}
