import '../../../utils/app_imports.dart';
import 'package:pinkpawscat/views/screens/address_billing_page.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            Get.to(() => const AddressBillingPage());
          },
          child: Center(
            child: InteractiveViewer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      Images.cartIcon,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return child;
                        }
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: frame != null
                              ? child
                              : const SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
