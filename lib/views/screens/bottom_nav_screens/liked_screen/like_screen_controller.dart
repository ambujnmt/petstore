import 'package:pinkpawscat/models/user_model.dart';
import 'package:pinkpawscat/utils/app_imports.dart';

class LikedScreenController extends GetxController {
  final user = Rxn<UserModel>(UserStorage.getUserData());

  Future<void> refreshData() async {
    user.value = UserStorage.getUserData();
  }
}
