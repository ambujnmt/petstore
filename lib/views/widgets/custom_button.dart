import '../../utils/app_imports.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final bool loader;
  final Color? bgColor;
  final Color? textColor;
  final String? text;
  final double? textSize;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double height;
  final double? radius;
  final double bgColorOpacity;
  final bool intrinsicWidth;
  final bool intrinsicHeight;
  final bool transparent;
  final bool hideBorder;
  final bool hideShadow;
  final List<Widget>? suffix;
  const AppButton({
    super.key,
    this.text,
    this.onTap,
    this.loader = false,
    this.textSize,
    this.width,
    this.padding,
    this.intrinsicWidth = false,
    this.intrinsicHeight = false,
    this.transparent = false,
    this.hideBorder = false,
    this.hideShadow = true,
    this.height = 50,
    this.radius,
    this.bgColorOpacity = 1.0,
    this.bgColor,
    this.textColor,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: loader ? null : onTap,
          behavior: HitTestBehavior.opaque,
          child: IntrinsicWidth(
            child: Container(
              height: intrinsicHeight ? null : height,
              width: intrinsicWidth ? null : width ?? size.width,
              alignment: Alignment.center,
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                boxShadow: hideShadow
                    ? null
                    : [
                        BoxShadow(
                          blurRadius: 3,
                          color: black.withValues(alpha: .25),
                          offset: const Offset(0, 1.7),
                        )
                      ],
                gradient: bgColor == null && !transparent
                    ? LinearGradient(
                        colors: [
                          ColorConstants.selectedColor
                              .withValues(alpha: bgColorOpacity),
                          ColorConstants.deleteColor
                              .withValues(alpha: bgColorOpacity)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                color: bgColor ?? white,
                borderRadius:
                    BorderRadius.circular(radius ?? size.width * 0.03),
                border: hideBorder
                    ? null
                    : Border.all(
                        color: transparent
                            ? ColorConstants.selectedColor
                            : Colors.transparent,
                        width: 1.7,
                      ),
              ),
              child: loader
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  // ? AppLoader.widget(
                  //     size: height != null ? height! - 8 : 42,
                  //     color1: ColorConstants.kTertiary,
                  //   )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomText.qText(
                            text ?? 'customButton',
                            lines: 1,
                            size: textSize ?? height * .6,
                            weight: FontWeight.w700,
                            color: textColor ?? (transparent ? black : white),
                            align: TextAlign.center,
                          ),
                        ),
                        if (suffix != null) ...[widthSpace10, ...suffix!]
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
