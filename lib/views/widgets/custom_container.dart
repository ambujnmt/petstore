import 'package:pinkpawscat/services/global_services.dart';

import '../../utils/app_imports.dart';

class CustomContainer {
  static Widget lightContainer({
    final Color? color,
    final EdgeInsetsGeometry? margin,
    final EdgeInsetsGeometry? padding,
    final Widget? child,
    final double? radius,
    final double? height,
    final double? width,
    final bool hideShadow = false,
  }) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(10),
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? white,
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: hideShadow
            ? null
            : [
                BoxShadow(
                  blurRadius: 4,
                  color: black.withValues(alpha: .3),
                  offset: const Offset(0, 1),
                )
              ],
      ),
      child: child,
    );
  }

  static Widget darkContainer({
    final Color? color,
    final EdgeInsetsGeometry? margin,
    final EdgeInsetsGeometry? padding,
    final Widget? child,
    final double? radius,
    final double? height,
    final double? width,
    final bool hideShadow = false,
  }) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(10),
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? fromHex('f8f9fb'),
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: hideShadow
            ? null
            : [
                BoxShadow(
                  blurRadius: 4,
                  color: black.withValues(alpha: .3),
                  offset: const Offset(0, 1),
                )
              ],
      ),
      child: child,
    );
  }
}
