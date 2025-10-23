import '../../../utils/app_imports.dart';
import 'package:pinkpawscat/views/screens/address_billing_page.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'My Cart'),
      bottomNavigationBar: IntrinsicHeight(
          child: Padding(
        padding:
            AppDimentions.defaultScreenPadding.copyWith(bottom: 15, top: 10),
        child: AppButton(
          text: 'Proceed to chekout',
          onTap: () => Get.to(() => const AddressBillingPage()),
        ),
      )),
    );
  }
}
