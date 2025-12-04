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
  return GestureDetector(
    onTap: onTap,
    child: CustomContainer.lightContainer(
      height: buttonSize,
      width: buttonSize,
      border: border,
      shape: BoxShape.circle,
      hideShadow: hideShadow ?? true,
      paddingValue: padding ?? iconPadding,
      color: bgColor ?? fromHex('e0fff4'),
      child: imgIcon == null
          ? Icon(
              icon ?? Icons.health_and_safety_outlined,
              color: iconColor,
              size: iconSize ?? buttonSize * 0.5,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imgIcon,
                  color: iconColor,
                  height: iconSize ?? buttonSize * 0.6,
                  width: iconSize ?? buttonSize * 0.6,
                  fit: BoxFit.contain,
                ),
              ],
            ),
    ),
  );
}
