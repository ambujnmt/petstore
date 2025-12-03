import 'package:pinkpawscat/models/user_model.dart';
import 'package:pinkpawscat/utils/app_imports.dart';

class SavedAddressScreenController extends GetxController {
  final user = Rxn<UserModel>(UserStorage.getUserData());
}
