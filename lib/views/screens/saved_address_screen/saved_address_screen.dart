import '../../../utils/app_imports.dart';

class SaveAddressScreen extends StatefulWidget {
  const SaveAddressScreen({super.key});

  @override
  State<SaveAddressScreen> createState() => _SaveAddressScreenState();
}

class _SaveAddressScreenState extends State<SaveAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: 'Saved Address'),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.home),
                        SizedBox(width: screenWidth * 0.02),
                        CustomText.qText(
                          'Home',
                          size: screenWidth * 0.05,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    CustomText.pText(
                      '106, Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      size: screenWidth * 0.035,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CustomText.qText(
                            'Edit',
                            size: screenWidth * 0.045,
                            weight: FontWeight.w700,
                            color: ColorConstants.selctedColor,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        GestureDetector(
                          onTap: () {},
                          child: CustomText.qText(
                            'Delete',
                            size: screenWidth * 0.045,
                            weight: FontWeight.w700,
                            color: ColorConstants.deleteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            AppButton(
              onTap: () => AppToast.show('Coming soon!'),
              text: 'Add New Address',
            ),
          ],
        ),
      ),
    );
  }
}
