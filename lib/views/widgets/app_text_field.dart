import '../../utils/app_imports.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
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

  const AppTextField({
    super.key,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.label,
    this.hintText,
    this.isSuffixIcon = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obsecureText = false,
    this.horizontalPadding = 0,
    this.readOnly = false,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
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
        TextField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText ?? "Input text",
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
          ),
        ),
        heightSpace20,
      ],
    );
  }
}
