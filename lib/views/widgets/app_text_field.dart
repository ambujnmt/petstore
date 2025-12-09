import '../../utils/app_imports.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? node;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextCapitalization? capitalization;
  final String? hintText;
  final String? label;
  final Widget? prefixIcon;
  final bool? obsecureText;
  final double? textSize;
  final bool readOnly;
  final bool isRequired;
  final bool useObscure;
  final RxString? errorText;
  final void Function(String input)? onChanged;
  final int? minLines;
  final int? maxLines;
  final List<Widget>? actions;
  final double? bottomPadding;
  final double? radiusValue;
  final EdgeInsetsGeometry? padding;
  final bool isDense;
  AppTextField({
    super.key,
    this.controller,
    this.node,
    this.textSize,
    this.inputType,
    this.padding,
    this.capitalization,
    this.inputAction,
    this.isDense = true,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.radiusValue,
    this.minLines,
    this.maxLines,
    this.bottomPadding,
    this.actions,
    this.obsecureText = false,
    this.readOnly = false,
    this.isRequired = false,
    this.useObscure = false,
    this.onChanged,
    RxString? errorText,
  }) : errorText = errorText ?? ''.obs;

  @override
  Widget build(BuildContext context) {
    final obscureText = (useObscure ? true : false).obs;
    return Column(
      children: [
        if (label != null) ...[
          Row(
            children: [
              widthSpace5,
              Flexible(
                  child: CustomText.qText(label!, weight: FontWeight.w700)),
              if (isRequired) CustomText.qText('*', color: red)
            ],
          ),
          heightSpace4,
        ],
        Obx(
          () => TextField(
            controller: controller,
            focusNode: node,
            readOnly: readOnly,
            textInputAction: inputAction,
            keyboardType: inputType,
            textCapitalization: capitalization ?? TextCapitalization.none,
            style: CustomText.pTextStyle(size: textSize),
            obscureText: obscureText.value,
            minLines: useObscure ? 1 : minLines ?? 1,
            maxLines: useObscure ? 1 : maxLines,
            onChanged: onChanged ?? (value) => errorText!(''),
            decoration: InputDecoration(
              isDense: isDense,
              prefixIcon: prefixIcon,
              contentPadding: padding,
              errorText: errorText!.value.isEmpty ? null : errorText!.value,
              errorStyle: CustomText.qTextStyle(size: 15),
              hintText: hintText ?? "Input text",
              hintStyle: CustomText.qTextStyle(size: textSize),
              border: _outlineInputBorder(radiusValue: radiusValue),
              enabledBorder: _outlineInputBorder(radiusValue: radiusValue),
              focusedBorder:
                  _outlineInputBorder(radiusValue: radiusValue).copyWith(
                borderSide: const BorderSide(color: Colors.pink, width: 2),
              ),
              suffixIcon: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (actions != null) ...actions!,
                    if (useObscure)
                      IconButton(
                        onPressed: obscureText.toggle,
                        icon: Icon(
                          obscureText.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomPadding == null ? heightSpace15 : SizedBox(height: bottomPadding),
      ],
    );
  }
}

OutlineInputBorder _outlineInputBorder({double? radiusValue}) {
  return OutlineInputBorder(
    borderRadius:
        BorderRadius.circular(radiusValue ?? AppDimentions.defaultBoxRadius),
    borderSide: BorderSide(color: grey[400]!),
  );
}
