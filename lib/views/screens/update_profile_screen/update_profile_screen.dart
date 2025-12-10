import 'package:pinkpawscat/utils/app_imports.dart';
import 'update_profile_screen_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final _con = Get.put(UpdateProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: (size) =>
          ListView(padding: AppDimentions.defaultScreenPadding, children: [
        heightSpace30,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CustomContainer.lightContainer(
                  shape: BoxShape.circle,
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.zero,
                  child: AppNetworkImage(
                    imageUrl: '',
                    errorWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(height: 60, width: 60, Images.profileIcon),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -7,
                  right: -7,
                  child: GestureDetector(
                    onTap: () => AppToast.show('Coming soon!'),
                    child: CustomContainer.lightContainer(
                      shape: BoxShape.circle,
                      isGradient: true,
                      child: Image.asset(
                        height: 25,
                        width: 25,
                        Images.editImg,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        heightSpace50,
        AppTextField(
          label: 'First Name',
          controller: _con.fNameController,
          radiusValue: AppDimentions.boxRadiusXL,
          hintText: 'Enter your last name',
          errorText: _con.fNameError,
          bottomPadding: 22,
          isRequired: true,
        ),
        AppTextField(
          label: 'Last Name',
          controller: _con.lNameController,
          radiusValue: AppDimentions.boxRadiusXL,
          hintText: 'Enter your last name',
          errorText: _con.lNameError,
          bottomPadding: 22,
          isRequired: true,
        ),
        AppTextField(
          label: 'Email Address',
          controller: _con.emailController,
          hintText: 'Enter your email address',
          bottomPadding: 22,
          errorText: _con.emailError,
          radiusValue: AppDimentions.boxRadiusXL,
          readOnly: true,
          isRequired: true,
        ),
        // AppTextField(
        //   label: 'Phone Number',
        //   controller: _con.phoneController,
        //   hintText: 'Enter your phone number',
        //   bottomPadding: 22,
        //   errorText: _con.phoneError,
        //   radiusValue: AppDimentions.boxRadiusXL,
        //   isRequired: true,
        //   readOnly: _con.user.value!.mobile.isNotEmpty,
        // ),
        heightSpace30,
        AppButton(text: 'Save & Change', onTap: () => _con.onSubmit()),
        heightSpace70
      ]),
    );
  }
}
