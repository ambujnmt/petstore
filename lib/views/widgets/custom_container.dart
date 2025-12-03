import '../../utils/app_imports.dart';

class CustomContainer {
  static Widget lightContainer({
    final Color? color,
    final EdgeInsetsGeometry? margin,
    final EdgeInsetsGeometry? padding,
    final Widget? child,
    final BorderRadiusGeometry? radius,
    final double? paddingValue,
    final double? height,
    final double? width,
    final bool hideShadow = false,
    final bool isGradient = false,
    final BoxShape shape = BoxShape.rectangle,
    final Border? border,
    final double? bgColorOpacity,
    final double? radiusValue,
  }) {
    // FINAL BORDER RADIUS
    final BorderRadiusGeometry? radiusFinal = shape == BoxShape.rectangle
        ? (radius ??
            BorderRadius.circular(
              radiusValue ?? AppDimentions.defaultBoxRadius,
            ))
        : null;

// MAIN CHILD INSIDE
    Widget content = Padding(
      padding: padding ?? const EdgeInsets.all(10),
      child: child,
    );

    // APPLY CLIPPING ONLY WHEN NECESSARY
    if (shape == BoxShape.rectangle && radiusFinal != null) {
      content = ClipRRect(borderRadius: radiusFinal, child: content);
    }

    return Container(
        height: height,
        width: width,
        margin: margin,
        clipBehavior: shape == BoxShape.circle ? Clip.antiAlias : Clip.none,
        decoration: BoxDecoration(
          shape: shape,
          border: border,
          borderRadius: radiusFinal,
          color: isGradient ? null : color ?? white,
          boxShadow: hideShadow
              ? null
              : [
                  BoxShadow(
                    blurRadius: 3,
                    color: black.withValues(alpha: .25),
                    offset: const Offset(0, 1.7),
                  )
                ],
          gradient: isGradient
              ? LinearGradient(
                  colors: [
                    ColorConstants.selectedColor
                        .withValues(alpha: bgColorOpacity),
                    ColorConstants.deleteColor.withValues(alpha: bgColorOpacity)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
        ),
        child: content);
  }

  static Widget darkContainer({
    final Color? color,
    final EdgeInsetsGeometry? margin,
    final EdgeInsetsGeometry? padding,
    final Widget? child,
    final BorderRadiusGeometry? radius,
    final double? height,
    final double? width,
    final bool hideShadow = false,
    final BoxShape shape = BoxShape.rectangle,
    final double? radiusValue,
  }) {
    // FINAL BORDER RADIUS
    final BorderRadiusGeometry? radiusFinal = shape == BoxShape.rectangle
        ? (radius ??
            BorderRadius.circular(
              radiusValue ?? AppDimentions.defaultBoxRadius,
            ))
        : null;

// MAIN CHILD INSIDE
    Widget content = Padding(
      padding: padding ?? const EdgeInsets.all(10),
      child: child,
    );

    // APPLY CLIPPING ONLY WHEN NECESSARY
    if (shape == BoxShape.rectangle && radiusFinal != null) {
      content = ClipRRect(borderRadius: radiusFinal, child: content);
    }

    return Container(
        height: height,
        width: width,
        margin: margin,
        clipBehavior: shape == BoxShape.circle ? Clip.antiAlias : Clip.none,
        decoration: BoxDecoration(
          shape: shape,
          borderRadius: radiusFinal,
          color: color ?? fromHex('f8f9fb'),
          boxShadow: hideShadow
              ? null
              : [
                  BoxShadow(
                    blurRadius: 4,
                    color: black.withValues(alpha: .27),
                    offset: const Offset(0, 1.7),
                  )
                ],
        ),
        child: content);
  }
}
