import '../../../../utils/app_imports.dart';
import 'package:pinkpawscat/views/screens/nav_screen.dart';
import 'package:pinkpawscat/views/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Spacer(flex: 2),
                AppTextField(
                  controller: emailController,
                  hintText: 'Email Address',
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                AppTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: ColorConstants.textColor),
                    ),
                  ),
                ),
                heightSpace30,
                AppButton(
                  text: 'LOGIN',
                  onTap: () => Get.to(const NavScreen()),
                ),
                const SizedBox(height: 1),
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(const SignupScreen());
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          color: ColorConstants.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
