import 'package:pinkpawscat/views/screens/contact_us_screen/contact_us_screen_controller.dart';

import '../../../utils/app_imports.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final _con = Get.put(ContactUsScreenController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'Contact Us'),
      body: (size) =>
          ListView(padding: AppDimentions.defaultScreenPadding, children: [
        heightSpace50,
        AppTextField(
          hintText: 'Name',
          bottomPadding: 22,
          isRequired: true,
          errorText: _con.nameError,
          controller: _con.nameController,
          radiusValue: AppDimentions.boxRadiusXL,
          inputAction: TextInputAction.next,
        ),
        AppTextField(
          hintText: 'Phone',
          bottomPadding: 22,
          controller: _con.phoneController,
          errorText: _con.phoneError,
          inputType: TextInputType.phone,
          radiusValue: AppDimentions.boxRadiusXL,
          inputAction: TextInputAction.next,
        ),
        AppTextField(
          hintText: 'Email',
          isRequired: true,
          bottomPadding: 22,
          controller: _con.emailController,
          errorText: _con.emailError,
          radiusValue: AppDimentions.boxRadiusXL,
          inputType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
        ),
        AppTextField(
          minLines: 4,
          maxLines: 7,
          bottomPadding: 22,
          hintText: 'How can we help?',
          controller: _con.howController,
          radiusValue: AppDimentions.boxRadiusXL,
        ),
        heightSpace30,
        AppButton(text: 'Send Message', onTap: _con.onSendTap),
        heightSpace70
      ]),
    );
  }
}
