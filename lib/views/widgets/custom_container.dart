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
    final BoxShape? shape,
  }) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? white,
        borderRadius:
            shape == null ? BorderRadius.circular(radius ?? 10) : null,
        shape: shape ?? BoxShape.rectangle,
        boxShadow: hideShadow
            ? null
            : [
                BoxShadow(
                  blurRadius: 3,
                  color: black.withValues(alpha: .25),
                  offset: const Offset(0, 1.7),
                )
              ],
      ),
      child: shape == BoxShape.circle
          ? ClipOval(
              child: Padding(
                padding: padding ?? const EdgeInsets.all(10),
                child: child,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 10),
              child: Padding(
                padding: padding ?? const EdgeInsets.all(10),
                child: child,
              ),
            ),
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
    final BoxShape? shape,
  }) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? fromHex('f8f9fb'),
        borderRadius:
            shape == null ? BorderRadius.circular(radius ?? 10) : null,
        shape: shape ?? BoxShape.rectangle,
        boxShadow: hideShadow
            ? null
            : [
                BoxShadow(
                  blurRadius: 3,
                  color: black.withValues(alpha: .25),
                  offset: const Offset(0, 1.7),
                )
              ],
      ),
      child: shape == BoxShape.circle
          ? ClipOval(
              child: Padding(
                padding: padding ?? const EdgeInsets.all(10),
                child: child,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 10),
              child: Padding(
                padding: padding ?? const EdgeInsets.all(10),
                child: child,
              ),
            ),
    );
  }
}
