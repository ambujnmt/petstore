import 'package:pinkpawscat/utils/app_imports.dart';
import 'category_details_screen_controller.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(CategoryDetailsScreenController(category: category));
    return const Placeholder();
  }
}
