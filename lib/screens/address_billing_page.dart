import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/screens/payment_screen.dart';
import '../utils/custom_text.dart';

class AddressBillingPage extends StatefulWidget {
  const AddressBillingPage({super.key});

  @override
  State<AddressBillingPage> createState() => _AddressBillingPageState();
}
class _AddressBillingPageState extends State<AddressBillingPage> {
  final customText = CustomText();
  final nameController = TextEditingController();
  final lastController = TextEditingController();
  final companyNameController = TextEditingController();
  final countryRegionController = TextEditingController();
  final streetAddressController = TextEditingController();
  final townCityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final noteController = TextEditingController();

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.pink, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(
              'assets/images/backbutton.png',
              width: 25,
              height: 25,
            ),
          ),
        ),
        title: customText.kText(
          'Your order',
          20,
          FontWeight.w700,
          const Color(0xff4e1c74),
          TextAlign.start,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              decoration: new BoxDecoration(
                  color:  Colors.white,
                  boxShadow: const [BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  ),],
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText.kPText('Summary', 16, FontWeight.w600,
                        Colors.black, TextAlign.start),
                    SizedBox(height: height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText.kPText('Subtotal', 14, FontWeight.w500,
                            Colors.grey.shade600, TextAlign.start),
                        customText.kPText('\$1550.00', 14, FontWeight.w500,
                            Colors.black, TextAlign.start),
                      ],
                    ),
                    SizedBox(height: height * 0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText.kPText('Delivery', 14, FontWeight.w500,
                            Colors.grey.shade600, TextAlign.start),
                        customText.kPText('Free', 14, FontWeight.w500,
                            Colors.green, TextAlign.start),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    Center(
                      child: Card(
                        color: const Color(0xffeff6ff),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customText.kPText(
                            'Adoption fees help cover vaccinations,\nmicrochipping, and initial veterinary care.',
                            11,
                            FontWeight.w400,
                            const Color(0xff1e40af),
                            TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText.kPText('Total', 15, FontWeight.w600,
                            Colors.black, TextAlign.start),
                        customText.kPText('\$1550.00', 15, FontWeight.w600,
                            Colors.black, TextAlign.start),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              decoration: new BoxDecoration(
                  color:  Colors.white,
                  boxShadow: const [BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  ),],
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText.kText('Billing Details', 18, FontWeight.w700,
                         Colors.black, TextAlign.start),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText.kText(
                                  'First Name',
                                  12,
                                  FontWeight.w500,
                                  Colors.black,
                                  TextAlign.start),
                              const SizedBox(height: 5),
                              TextField(
                                controller: nameController,
                                decoration: _inputDecoration("First Name"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText.kText('Last Name', 12, FontWeight.w500,
                                   Colors.black, TextAlign.start),
                              const SizedBox(height: 5),
                              TextField(
                                controller: lastController,
                                decoration: _inputDecoration("Last Name"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _labelField(
                        "Company name (optional)", companyNameController),
                    _labelField("Country / Region", countryRegionController),
                    _labelField("Street address", streetAddressController),
                    _labelField("", streetAddressController),
                    _labelField("Town / City", townCityController),
                    _labelField("State", stateController),
                    _labelField("Zip Code", zipCodeController),
                    _labelField("Phone", phoneController),
                    _labelField("Email address", emailController),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            customText.kPText("Ship to a different address?", 14, FontWeight.w500, Colors.grey, TextAlign.start),
            SizedBox(height: height * 0.03,),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              decoration: new BoxDecoration(
                  color:  Colors.white,
                  boxShadow: const [BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  ),],
                borderRadius: BorderRadius.circular(6)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText.kText('Billing Details', 18, FontWeight.w700,
                        Colors.black, TextAlign.start),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText.kText(
                                  'First Name',
                                  12,
                                  FontWeight.w500,
                                  Colors.black,
                                  TextAlign.start),
                              const SizedBox(height: 5),
                              TextField(
                                controller: nameController,
                                decoration: _inputDecoration("First Name"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText.kText('Last Name', 12, FontWeight.w500,
                                  Colors.black, TextAlign.start),
                              const SizedBox(height: 5),
                              TextField(
                                controller: lastController,
                                decoration: _inputDecoration("Last Name"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _labelField(
                        "Company name (optional)", companyNameController),
                    _labelField("Country / Region", countryRegionController),
                    _labelField("Street address", streetAddressController),
                    _labelField("", streetAddressController),
                    _labelField("Town / City", townCityController),
                    _labelField("State", stateController),
                    _labelField("Zip Code", zipCodeController),
                    _labelField("Phone", phoneController),
                    _labelField("Email address", emailController),
                  ],
                ),
              ),
            ),
            customText.kText("Order notes (optional)", 18, FontWeight.w700,
                Colors.black, TextAlign.start),
            const SizedBox(height: 8),
            TextField(
              controller: noteController,
              maxLines: 3,
              decoration: _inputDecoration(
                  "Note about your order, e.g. special notes for delivery."),
            ),
            SizedBox(height: height * 0.03),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.to(const PaymentScreen());
                },
                child: Image.asset(
                  'assets/images/make_paymentbtn.png',
                  height: 50,
                  width: width * 0.9,
                  fit: BoxFit.contain,
                ),
              ),
              )
          ],
        ),
      ),
    );
  }

  Widget _labelField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            customText.kPText(
                label, 12, FontWeight.w500, Colors.black, TextAlign.start),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: _inputDecoration(label),
          ),
        ],
      ),
    );
  }
}
