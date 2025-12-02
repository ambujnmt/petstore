import 'package:pinkpawscat/utils/app_imports.dart';

Widget customIconButton({
  final IconData? icon,
  final String? imgIcon,
  final Color? bgColor,
  final Color? iconColor,
  final VoidCallback? onTap,
  final double? size,
  final bool? hideShadow,
  final Border? border,
  final double? padding,
  final double? iconSize,
}) {
  final double buttonSize = size ?? 40;
  final double iconPadding = buttonSize * 0.01;
  final double iconBoxSize = buttonSize - (iconPadding * 2);
  return GestureDetector(
    onTap: onTap,
    child: CustomContainer.lightContainer(
      height: buttonSize,
      width: buttonSize,
      border: border,
      shape: BoxShape.circle,
      hideShadow: hideShadow ?? true,
      paddingValue: iconPadding,
      color: bgColor ?? fromHex('e0fff4'),
      child: imgIcon == null
          ? Icon(
              icon ?? Icons.health_and_safety_outlined,
              color: iconColor,
              size: iconSize ?? iconBoxSize * 0.6,
            )
          : Image.asset(
              imgIcon,
              color: iconColor,
              height: iconSize ?? iconBoxSize * 0.7,
              width: iconSize ?? iconBoxSize * 0.7,
              fit: BoxFit.contain,
            ),
    ),
  );
}
