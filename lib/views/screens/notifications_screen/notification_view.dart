import '../../../utils/app_imports.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: 'Notifications'),
      body: SafeArea(
        child: ListView(
          padding: AppDimentions.defaultScreenPadding,
          children: [
            ...List.generate(5, (index) {
              return CustomContainer.lightContainer(
                  margin: const EdgeInsets.only(top: 18),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer.lightContainer(
                              color: fromHex('f3e8ff'),
                              padding: const EdgeInsets.all(4),
                              hideShadow: true,
                              radius: 3,
                              height: 28,
                              width: 28,
                              child: Image.asset(Images.pawIcon)),
                          widthSpace10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.qText(
                                  'New Kitten Available - Rosalina',
                                  size: 17,
                                  weight: FontWeight.w700),
                              heightSpace3,
                              CustomText.pText(
                                  'Meet Rosalina, available for adoption',
                                  size: 12,
                                  color: fromHex('#4B5563')),
                            ],
                          ),
                        ],
                      ),
                      heightSpace20,
                      AppButton(
                        intrinsicWidth: true,
                        height: 30,
                        // textSize: 16,
                        text: 'View Profile', bgColorOpacity: .75,
                        onTap: () => AppToast.show('Coming soon'),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomText.pText('2h Ago',
                            size: 14, itailic: true, color: grey),
                      )
                    ],
                  ));
            }),
            heightSpace50,
          ],
        ),
      ),
    );
  }
}
