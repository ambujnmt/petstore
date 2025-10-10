import 'package:pinkpawscat/services/global_services.dart';

import '../../../../utils/app_imports.dart';
import 'package:pinkpawscat/views/screens/authorization/sign_up_screen/signup_screen.dart';
import 'login_screen_conroller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _con = Get.put(LoginScreenConroller());

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
                  controller: _con.emailController,
                  hintText: 'Email Address',
                  inputType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  errorText: _con.emailError,
                ),
                AppTextField(
                  controller: _con.passwordController,
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  useObscure: true,
                  errorText: _con.passwordError,
                  bottomPadding: 0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: CustomText.qText("Forget Password?",
                        color: ColorConstants.textColor,
                        weight: FontWeight.bold),
                  ),
                ),
                heightSpace30,
                AppButton(
                  text: 'LOGIN',
                  onTap: _con.onLoginTap,
                ),
                const SizedBox(height: 1),
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.qText("Don’t have an account? "),
                    InkWell(
                      onTap: () {
                        closeKeyboard();
                        Get.to(() => const SignupScreen());
                      },
                      child: CustomText.qText(
                        "Signup",
                        color: ColorConstants.textColor,
                        weight: FontWeight.bold,
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
