import 'package:pinkpawscat/views/screens/order_history_screen/order_details_screen/widgets/ods_cat_card.dart';

import '../../../../utils/app_imports.dart';
import 'widgets/step_counter_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'Order Details'),
      body: (size) => ListView(
        padding: AppDimentions.defaultScreenPadding,
        children: [
          heightSpace10,
          odsCatCard(),
          heightSpace15,
          CustomText.qText('Delivery Info', size: 20, weight: FontWeight.w700),
          heightSpace15,
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                size: 15,
                color: transparent,
              ),
              widthSpace10,
              Expanded(child: CustomText.pText('Anamika Sharma', size: 20)),
            ],
          ),
          heightSpace4,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_pin,
                size: 15,
                color: grey,
              ),
              widthSpace10,
              Expanded(
                child: CustomText.pText(
                  'Sharjah Po Box 26475 Dubai, Zip code: 26475',
                  color: grey,
                  lines: 5,
                  size: 14,
                ),
              ),
            ],
          ),
          heightSpace4,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.phone,
                size: 15,
                color: grey,
              ),
              widthSpace10,
              Expanded(
                child: CustomText.pText(
                  '+971 (6)5732560',
                  color: grey,
                  size: 14,
                ),
              ),
            ],
          ),
          heightSpace20,
          CustomText.qText('Time Line', size: 20, weight: FontWeight.w700),
          heightSpace20,
          HorizontalStepTracker(
            currentStep: 2,
          ),
          heightSpace35,
          Row(
            children: [
              const Expanded(
                child: AppButton(
                  intrinsicHeight: true,
                  padding: EdgeInsets.symmetric(
                      vertical: AppDimentions.screenPaddingXS),
                  text: 'Track Shipment',
                  hideShadow: false,
                ),
              ),
              widthSpace10,
              Expanded(
                  child: AppButton(
                hideShadow: false,
                intrinsicHeight: true,
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimentions.screenPaddingXS),
                bgColor: fromHex('f4f4f6'),
                text: 'Download Invoice',
                textColor: black,
              ))
            ],
          ),
          heightSpace70
        ],
      ),
    );
  }
}
