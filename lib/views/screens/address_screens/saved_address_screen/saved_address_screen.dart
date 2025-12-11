import '../../../../utils/app_imports.dart';
import '../../bottom_nav_screens/profile_screen/widgets/goto_login_button.dart';
import '../add_new_address_screen/add_new_address_screen.dart';
import 'saved_address_screen_controller.dart';

class SaveAddressScreen extends StatefulWidget {
  const SaveAddressScreen({super.key});

  @override
  State<SaveAddressScreen> createState() => _SaveAddressScreenState();
}

class _SaveAddressScreenState extends State<SaveAddressScreen> {
  final _con = Get.put(SavedAddressScreenController());
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: 'Saved Address'),
      body: Obx(
        () => _con.isLoading.value
            ? AppLoader.widget()
            : _con.user.value == null
                ? AppRefreshIndicator(
                    onRefresh: _con.refreshData,
                    error: false,
                    child: ListView(
                      children: [
                        SizedBox(height: Get.height * .7),
                        gotoLoginButton()
                      ],
                    ),
                  )
                : _con.addresses.value == null
                    ? AppRefreshIndicator(
                        onRefresh: _con.refreshData,
                        error: true,
                        message: 'Something went wrong.',
                      )
                    : AppRefreshIndicator(
                        onRefresh: _con.refreshData,
                        error: _con.addresses.value!.isEmpty,
                        child: ListView(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          children: [
                            ..._con.addresses.value!.map(
                              (address) => CustomContainer.lightContainer(
                                margin: const EdgeInsets.only(bottom: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.home),
                                        SizedBox(width: screenWidth * 0.02),
                                        CustomText.qText(
                                          address.type.toUpperCase(),
                                          size: screenWidth * 0.05,
                                          weight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    CustomText.pText(
                                        'Mo. ${address.mobile}\n${address.flatNo}, ${address.direction}, ${address.address}, ${address.area}, ${address.city}, ${address.state} - ${address.pincode}',
                                        size: screenWidth * 0.035,
                                        lines: 7),
                                    SizedBox(height: screenHeight * 0.015),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              AppToast.show('Coming soon!'),
                                          child: CustomText.qText(
                                            'Edit',
                                            size: screenWidth * 0.045,
                                            weight: FontWeight.w700,
                                            color: ColorConstants.selectedColor,
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.05),
                                        GestureDetector(
                                          onTap: () =>
                                              _con.deleteAddress(address),
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
                            heightSpace100
                          ],
                        ),
                      ),
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(AppDimentions.screenPadding),
          child: AppButton(
            onTap: () => Get.to(() => const AddNewAddressScreen()),
            text: 'Add New Address',
          ),
        ),
      ),
    );
  }
}
