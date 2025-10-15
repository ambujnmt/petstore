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
}) {
  return GestureDetector(
    onTap: onTap,
    child: CustomContainer.lightContainer(
      height: size,
      width: size,
      border: border,
      shape: BoxShape.circle,
      hideShadow: hideShadow ?? true,
      color: bgColor ?? fromHex('e0fff4'),
      child: imgIcon == null
          ? Icon(
              icon ?? Icons.health_and_safety_outlined,
              color: iconColor,
            )
          : Image.asset(
              imgIcon,
              color: iconColor,
            ),
    ),
  );
}
