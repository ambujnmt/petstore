import '../../utils/app_imports.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? node;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextCapitalization? capitalization;
  final String? hintText;
  final String? label;
  final bool? isSuffixIcon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obsecureText;
  final Function()? onSuffixTap;
  final double horizontalPadding;
  final bool readOnly;
  final bool isRequired;
  final bool useObscure;
  final RxString? errorText;
  final void Function(String input)? onChanged;
  final int? minLines;
  final int? maxLines;
  final List<Widget>? actions;
  final double? bottomPadding;
  AppTextField({
    super.key,
    this.controller,
    this.node,
    this.inputType,
    this.capitalization,
    this.inputAction,
    this.label,
    this.hintText,
    this.isSuffixIcon = false,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.bottomPadding,
    this.suffixIcon,
    this.actions,
    this.onSuffixTap,
    this.obsecureText = false,
    this.horizontalPadding = 0,
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
              Flexible(child: CustomText.qText(label!)),
              if (isRequired) CustomText.qText('*', color: red)
            ],
          ),
          heightSpace4,
        ],
        Obx(
          () => TextField(
            controller: controller,
            focusNode: node,
            textInputAction: inputAction,
            keyboardType: inputType,
            textCapitalization: capitalization ?? TextCapitalization.none,
            style: CustomText.pTextStyle(),
            obscureText: obscureText.value,
            minLines: useObscure ? 1 : minLines ?? 1,
            maxLines: useObscure ? 1 : maxLines,
            onChanged: onChanged ?? (value) => errorText!(''),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              errorText: errorText!.value.isEmpty ? null : errorText!.value,
              errorStyle: CustomText.qTextStyle(size: 15),
              hintText: hintText ?? "Input text",
              hintStyle: CustomText.qTextStyle(),
              border: _outlineInputBorder,
              enabledBorder: _outlineInputBorder,
              focusedBorder: _outlineInputBorder.copyWith(
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

final _outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(color: Colors.grey),
);
