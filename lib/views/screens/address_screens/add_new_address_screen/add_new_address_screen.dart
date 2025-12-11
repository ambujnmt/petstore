import '../../../../utils/app_imports.dart';
import 'add_new_address_screen_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(AddNewAddressScreenController());
    return AppFixedBottomBar(
      opened: true,
      body: Image.asset(
        'assets/images/map.png',
        fit: BoxFit.cover,
      ),
      sliderWidgets: [
        Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: red,
              size: 28,
            ),
            widthSpace10,
            Expanded(
              child: CustomText.qText('Lorem Ipsum',
                  size: 20, weight: FontWeight.w700),
            )
          ],
        ),
        heightSpace10,
        CustomText.qText(
            '106,Lorem Ipsum is simply dummy text of the printing and type setting industry.',
            size: 16),
        heightSpace15,
        _customTextfield(
          hintText: 'House / FLat / Floor No.',
          controller: con.houseController,
          isRequired: true,
          errorText: con.houseError,
        ),
        heightSpace8,
        _customTextfield(
          hintText: 'Apartament / Road / Area',
          controller: con.apartmentController,
          isRequired: true,
          errorText: con.apartError,
        ),
        heightSpace8,
        _customTextfield(
          hintText: 'Locality',
          controller: con.localityController,
          isRequired: true,
          errorText: con.localError,
        ),
        heightSpace8,
        _customTextfield(
          hintText: 'Mobile No',
          controller: con.mobileController,
          isRequired: true,
          errorText: con.mobileError,
          inputType: TextInputType.phone,
        ),
        heightSpace8,
        Row(
          children: [
            Expanded(
              child: _customTextfield(
                hintText: 'State',
                isRequired: true,
                controller: con.stateController,
                errorText: con.stateError,
              ),
            ),
            widthSpace10,
            Expanded(
              child: _customTextfield(
                hintText: 'City',
                isRequired: true,
                controller: con.cityController,
                errorText: con.cityError,
              ),
            ),
          ],
        ),
        heightSpace8,
        _customTextfield(
          hintText: 'Zip Code',
          isRequired: true,
          controller: con.zipCodeController,
          errorText: con.zipError,
          inputType: TextInputType.number,
        ),
        heightSpace20,
        _customTextfield(
          maxLines: 6,
          minLines: 4,
          isRequired: true,
          borderType: _outLineBorder,
          hintText: 'Write Direction',
          controller: con.directionController,
          errorText: con.dirError,
        ),
        heightSpace20,
        AppButton(
          text: 'Confirm Location',
          onTap: con.onSubmit,
        ),
        heightSpace70
      ],
    );
  }
}

Widget _customTextfield({
  String? hintText,
  TextEditingController? controller,
  InputBorder borderType = _underLineBorder,
  int? maxLines,
  int? minLines,
  bool isRequired = false,
  RxString? errorText,
  TextInputType? inputType,
}) {
  errorText ??= ''.obs;
  return Obx(
    () => TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: inputType,
      onChanged: (value) => errorText!(''),
      decoration: InputDecoration(
        hint: Row(
          children: [
            CustomText.pText(hintText ?? '', color: grey),
            if (isRequired)
              CustomText.pText('*', color: red.withValues(alpha: .7))
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: AppDimentions.screenPaddingXXS,
            horizontal: AppDimentions.screenPaddingXS),
        errorText: errorText!.value.isEmpty ? null : errorText.value,
        border: borderType,
        disabledBorder: borderType,
        enabledBorder: borderType,
        focusedBorder: borderType,
      ),
    ),
  );
}

const _underLineBorder = UnderlineInputBorder(
  borderSide: BorderSide(width: 1.5, color: grey),
);

const _outLineBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 1.5, color: grey),
);
