import 'package:pinkpawscat/utils/app_imports.dart';

class OrderHistoryScreenController extends GetxController {
  final user = Rxn<UserModel>(UserStorage.getUserData());
}
