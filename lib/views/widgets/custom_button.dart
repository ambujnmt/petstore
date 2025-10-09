import '../../utils/app_imports.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final bool loader;
  final Color? bgColor;
  final Color? textColor;
  final String? text;
  final double fontSize;
  final double? width;
  final double? height;
  final bool intrinsicWidth;
  final bool intrinsicHeight;
  final bool transparent;
  final bool hideBorder;

  const AppButton({
    super.key,
    this.text,
    this.onTap,
    this.loader = false,
    this.fontSize = 25,
    this.width,
    this.intrinsicWidth = false,
    this.intrinsicHeight = false,
    this.transparent = false,
    this.hideBorder = false,
    this.height,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: loader ? null : onTap,
          behavior: HitTestBehavior.opaque,
          child: IntrinsicWidth(
            child: Container(
              height: intrinsicHeight ? null : height ?? 50,
              width: intrinsicWidth ? null : width ?? size.width,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                gradient: bgColor == null && !transparent
                    ? const LinearGradient(
                        colors: [
                          ColorConstants.selctedColor,
                          ColorConstants.deleteColor
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                color: bgColor ?? white,
                borderRadius: BorderRadius.circular(size.width * 0.03),
                border: hideBorder
                    ? null
                    : Border.all(
                        color: transparent
                            ? ColorConstants.selctedColor
                            : Colors.transparent,
                        width: 1.7,
                      ),
              ),
              child: Center(
                child: loader
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    // ? AppLoader.widget(
                    //     size: height != null ? height! - 8 : 42,
                    //     color1: ColorConstants.kTertiary,
                    //   )
                    : CustomText.qText(
                        text ?? 'customButton',
                        size: fontSize,
                        weight: FontWeight.w700,
                        color: textColor ?? (transparent ? black : white),
                        align: TextAlign.center,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
