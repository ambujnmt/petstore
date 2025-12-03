import 'package:pinkpawscat/utils/app_imports.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedMethod = "Paytm";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return AppScaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: 'Select a Payment Method'),
      body: (_) => Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.03)),
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Row(
                  children: [
                    Icon(Icons.home, size: width * 0.08, color: Colors.black),
                    SizedBox(width: width * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.pText(
                            "Home",
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: height * 0.005),
                          CustomText.pText(
                            '106, Lorem Ipsum is simply dummy text of the printing and type setting industry.',
                            size: 12,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(height: height * 0.005),
                          CustomText.pText(
                            "Phone No : 1234567890",
                            size: 12,
                            weight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: CustomText.pText(
                    "View All",
                    weight: FontWeight.w400,
                  )),
            ),
            SizedBox(height: height * 0.015),
            CustomText.pText(
              "Recommended",
              size: 20,
              weight: FontWeight.w400,
            ),
            SizedBox(height: height * 0.015),
            buildPaymentOption(
                "Paytm", "HDFC Bank **0011", Images.hdfcIcon, width),
            buildPaymentOption("HDFC Bank Credit Card",
                "VISA **0011 | Sant Singh", Images.hdfcIcon, width),
            buildPaymentOption("Klarna", "", Images.hdfcIcon, width),
            buildPaymentOption("Affirm", "", Images.hdfcIcon, width),
            const Spacer(),
            AppButton(
              text: 'Pay Now',
              onTap: () => AppToast.show('Coming soon.'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(
      String title, String subtitle, String imagePath, double width) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Row(
          children: [
            Radio<String>(
              activeColor: ColorConstants.selectedColor,
              value: title,
              groupValue: selectedMethod,
              onChanged: (val) {
                setState(() {
                  selectedMethod = val.toString();
                });
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.pText(title, size: 14),
                  if (subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: CustomText.pText(
                        subtitle,
                        size: 12,
                        weight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
            if (imagePath.isNotEmpty)
              Image.asset(
                imagePath,
                width: width * 0.08,
                height: width * 0.08,
                fit: BoxFit.contain,
              ),
          ],
        ),
      ),
    );
  }
}
