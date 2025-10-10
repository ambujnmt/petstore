import '../../../../utils/app_imports.dart';
import '../login_screen/login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/images/get_started.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: AppButton(
                text: 'Get Started',
                onTap: () => Get.offAll(() => LoginScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
