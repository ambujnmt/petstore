import '../../../../utils/app_imports.dart';
import 'signup_screen_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _con = Get.put(SignupScreenController());

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Images.loginBg,
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            padding: AppDimentions.defaultScreenPadding,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: viewInsets > 0 ? 70 : 200,
              ),
              AppTextField(
                label: 'Name',
                hintText: 'Full name',
                controller: _con.nameController,
                errorText: _con.nameError,
                inputType: TextInputType.name,
                capitalization: TextCapitalization.sentences,
                inputAction: TextInputAction.next,
                isRequired: true,
              ),
              AppTextField(
                label: 'Mobile',
                hintText: 'Mobile number',
                controller: _con.mobileController,
                inputType: TextInputType.phone,
                inputAction: TextInputAction.next,
                errorText: _con.mobileError,
                isRequired: true,
              ),
              AppTextField(
                label: 'Email',
                hintText: 'Email address',
                controller: _con.emailController,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                errorText: _con.emailError,
                isRequired: true,
              ),
              AppTextField(
                label: 'Password',
                hintText: 'Password',
                controller: _con.passwordController,
                useObscure: true,
                errorText: _con.passError,
                isRequired: true,
              ),
              AppTextField(
                label: 'Confirm Password',
                hintText: 'Confirm password',
                controller: _con.confirmPasswordController,
                useObscure: true,
                errorText: _con.cPassError,
                isRequired: true,
              ),
              heightSpace10,
              AppButton(
                text: 'SIGN UP',
                onTap: _con.onSignupTap,
              ),
              heightSpace30,
            ],
          ),
        ],
      ),
    );
  }
}
