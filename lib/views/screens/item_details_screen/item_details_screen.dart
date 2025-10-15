import 'package:pinkpawscat/views/screens/item_details_screen/widgets/image_widget.dart';

import '../../../utils/app_imports.dart';
import 'item_details_screen_controller.dart';
import 'widgets/cat_details_widget.dart';
import 'widgets/health_widget.dart';
import 'widgets/personality_widget.dart';
import 'widgets/recommended_widget.dart';

class ItemDetailsPage extends StatelessWidget {
  ItemDetailsPage({super.key});

  final _con = Get.put(ItemDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          imageWidget(),
          heightSpace14,
          Padding(
            padding: AppDimentions.defaultScreenPadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              catDetailsWidget(),
              heightSpace25,
              healthWidget(),
              heightSpace25,
              personalityWidget(),
              heightSpace25,
              customCheckbox(
                  text:
                      'I confirm I have read and agree to the Terms & Service'),
              heightSpace25,
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      height: 40,
                      text: 'Pay Deposit',
                      bgColorOpacity: .75,
                      onTap: () => AppToast.show('Coming soon!'),
                    ),
                  ),
                  widthSpace15,
                  Expanded(
                      child: AppButton(
                    height: 40,
                    transparent: true,
                    text: 'Pay In Full',
                    onTap: () => AppToast.show('Coming soon!'),
                  ))
                ],
              ),
              heightSpace8,
              CustomText.qText('Pay a 25% deposit',
                  size: 10, color: ColorConstants.selctedColor),
              heightSpace13,
              CustomText.qText('Deposits are Non-Refundable',
                  size: 12, color: ColorConstants.kDarkGrey),
              heightSpace30,
              Center(
                child: AppButton(
                  width: Get.width - 100,
                  height: 40,
                  text: 'Adopt Me Now',
                  onTap: () => AppToast.show('Coming soon!'),
                ),
              ),
            ]),
          ),
          heightSpace30,
          recommendedWidget(),
          heightSpace100
        ],
      ),
    ));
  }
}
