import '../../../utils/app_imports.dart';

class OrderSummeryScreenController extends GetxController {
  final useDifferentAddress = false.obs;

  final nameController = TextEditingController();
  final lastController = TextEditingController();
  final companyNameController = TextEditingController();
  final countryRegionController = TextEditingController();
  final streetAddressController = TextEditingController();
  final townCityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final noteController = TextEditingController();
}
