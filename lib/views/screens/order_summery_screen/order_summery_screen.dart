import 'package:pinkpawscat/utils/app_imports.dart';
import '../payment_screen/payment_screen.dart';
import 'order_summery_screen_controller.dart';

class OrderSummeryScreen extends StatelessWidget {
  const OrderSummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(OrderSummeryScreenController());
    return AppScaffold(
        appBar: customAppBar(title: 'Your order'),
        body: (size) {
          final height = size.height;
          return SingleChildScrollView(
            padding: AppDimentions.defaultScreenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace10,
                CustomContainer.darkContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.pText('Summary', size: 16),
                      heightSpace20,
                      Row(
                        children: [
                          CustomText.pText(
                            'Subtotal',
                            size: 14,
                            weight: FontWeight.w400,
                            color: grey[600],
                          ),
                          Expanded(
                            child: CustomText.pText(
                              '\$1550.00',
                              size: 14,
                              weight: FontWeight.w400,
                              align: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      heightSpace20,
                      Row(
                        children: [
                          CustomText.pText(
                            'Delivery',
                            size: 14,
                            weight: FontWeight.w400,
                            color: grey[600],
                          ),
                          Expanded(
                            child: CustomText.pText(
                              'Free',
                              size: 14,
                              weight: FontWeight.w400,
                              align: TextAlign.right,
                              color: green,
                            ),
                          ),
                        ],
                      ),
                      heightSpace25,
                      CustomContainer.darkContainer(
                        width: Get.width,
                        child: CustomText.pText(
                          'Adoption fees help cover vaccinations, microchipping, and initial veterinary care.',
                          size: 12,
                          weight: FontWeight.w400,
                          color: blue,
                        ),
                      ),
                      heightSpace20,
                      const DottedLine(),
                      heightSpace10,
                      Row(
                        children: [
                          CustomText.pText(
                            'Total',
                            size: 14,
                            weight: FontWeight.w600,
                          ),
                          Expanded(
                            child: CustomText.pText(
                              '\$155.65',
                              size: 16,
                              weight: FontWeight.w700,
                              align: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                CustomContainer.darkContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.qText(
                        'Billing Details',
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: DottedLine()),
                      Row(
                        children: [
                          Expanded(
                            child: _labelField(
                              label: 'First Name',
                              controller: con.nameController,
                            ),
                          ),
                          widthSpace5,
                          Expanded(
                            child: _labelField(
                              label: 'Last Name',
                              controller: con.lastController,
                            ),
                          ),
                        ],
                      ),
                      _labelField(
                          label: "Company name (optional)",
                          controller: con.companyNameController),
                      _labelField(
                          label: "Country / Region",
                          controller: con.countryRegionController),
                      _labelField(
                          label: "Street address",
                          controller: con.streetAddressController),
                      Row(
                        children: [
                          Expanded(
                            child: _labelField(
                                label: "Town / City",
                                controller: con.townCityController),
                          ),
                          widthSpace5,
                          Expanded(
                            child: _labelField(
                                label: "State",
                                controller: con.stateController),
                          ),
                        ],
                      ),
                      _labelField(
                        label: "Zip Code",
                        inputType: TextInputType.number,
                        controller: con.zipCodeController,
                      ),
                      _labelField(
                        label: "Phone",
                        inputType: TextInputType.phone,
                        controller: con.phoneController,
                      ),
                      _labelField(
                        label: "Email address",
                        inputType: TextInputType.emailAddress,
                        controller: con.emailController,
                      ),
                    ],
                  ),
                ),
                heightSpace28,
                customCheckbox(
                  value: con.useDifferentAddress,
                  text: "Ship to a different address?",
                  onChanged: () => con.useDifferentAddress.toggle(),
                ),
                heightSpace18,
                Obx(
                  () => AnimatedSize(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    child: Center(
                      child: !con.useDifferentAddress.value
                          ? const SizedBox.shrink()
                          : CustomContainer.darkContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText.qText(
                                    'Shipping Details',
                                    size: 18,
                                    weight: FontWeight.w700,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: DottedLine(),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _labelField(
                                            label: 'First Name',
                                            controller: con.nameController),
                                      ),
                                      widthSpace5,
                                      Expanded(
                                        child: _labelField(
                                            label: 'Last Name',
                                            controller: con.lastController),
                                      ),
                                    ],
                                  ),
                                  _labelField(
                                      label: "Company name (optional)",
                                      controller: con.companyNameController),
                                  _labelField(
                                      label: "Country / Region",
                                      controller: con.countryRegionController),
                                  _labelField(
                                      label: "Street address",
                                      controller: con.streetAddressController),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _labelField(
                                            label: "Town / City",
                                            controller: con.townCityController),
                                      ),
                                      widthSpace5,
                                      Expanded(
                                        child: _labelField(
                                            label: "State",
                                            controller: con.stateController),
                                      )
                                    ],
                                  ),
                                  _labelField(
                                    label: "Zip Code",
                                    inputType: TextInputType.number,
                                    controller: con.zipCodeController,
                                  ),
                                  _labelField(
                                    label: "Phone",
                                    inputType: TextInputType.phone,
                                    controller: con.phoneController,
                                  ),
                                  _labelField(
                                    label: "Email address",
                                    inputType: TextInputType.emailAddress,
                                    controller: con.emailController,
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
                Obx(() => con.useDifferentAddress.value
                    ? heightSpace20
                    : const SizedBox()),
                CustomContainer.darkContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.qText(
                        "Order notes (optional)",
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      const SizedBox(height: 8),
                      _labelField(
                        maxLines: 6,
                        minLines: 3,
                        inputAction: TextInputAction.newline,
                        controller: con.noteController,
                        hintText:
                            "Note about your order, e.g. special notes for delivery.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                AppButton(
                  text: 'Select Payment',
                  onTap: () => Get.to(() => const PaymentScreen()),
                ),
                heightSpace60
              ],
            ),
          );
        });
  }
}

Widget _labelField({
  String? label,
  String? hintText,
  TextEditingController? controller,
  int? minLines,
  int maxLines = 1,
  bool isRequired = false,
  TextInputAction inputAction = TextInputAction.next,
  TextInputType? inputType,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null && label.isNotEmpty) ...[
        CustomText.pText(label, size: 12),
        heightSpace5,
      ],
      TextField(
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        textInputAction: inputAction,
        keyboardType: inputType,
        decoration: InputDecoration(
          isDense: true,
          hint: Row(
            children: [
              Expanded(
                  child:
                      CustomText.pText(hintText ?? label ?? '', color: grey)),
              if (isRequired)
                CustomText.pText('*', color: red.withValues(alpha: .7))
            ],
          ),
          contentPadding: const EdgeInsets.all(AppDimentions.screenPaddingXS),
          filled: true,
          fillColor: grey[200],
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
        ),
      ),
      heightSpace15
    ],
  );
}

_border() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppDimentions.boxRadiusXS),
    borderSide: BorderSide.none,
  );
}
