import '../../../../utils/app_imports.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFixedBottomBar(
      opened: true,
      maxHeight: .9,
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
        _customTextfield(hintText: 'House / FLat / Floor No.'),
        heightSpace8,
        _customTextfield(hintText: 'Apartament / Road / Area'),
        heightSpace8,
        _customTextfield(hintText: 'Locality  / Area'),
        heightSpace8,
        _customTextfield(hintText: 'Mobile No'),
        heightSpace8,
        Row(
          children: [
            Expanded(child: _customTextfield(hintText: 'State')),
            widthSpace10,
            Expanded(child: _customTextfield(hintText: 'City')),
          ],
        ),
        heightSpace8,
        _customTextfield(hintText: 'Zip Code'),
        heightSpace20,
        _customTextfield(
          hintText: 'Write Direction',
          borderType: _outLineBorder,
          maxLines: 6,
          minLines: 4,
        ),
        heightSpace70
      ],
    );
  }
}

TextField _customTextfield({
  String? hintText,
  TextEditingController? controller,
  InputBorder? borderType,
  int? maxLines,
  int? minLines,
}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    minLines: minLines,
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: AppDimentions.screenPaddingXS),
      hintStyle: CustomText.pTextStyle(color: grey),
      border: borderType ?? _underLineBorder,
      disabledBorder: borderType ?? _underLineBorder,
      enabledBorder: borderType ?? _underLineBorder,
    ),
  );
}

const _underLineBorder = UnderlineInputBorder(
  borderSide: BorderSide(width: 1.5, color: grey),
);

const _outLineBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 1.5, color: grey),
);
