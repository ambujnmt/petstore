import '../../utils/app_imports.dart';

AppBar customAppBar({
  final String? title,
  final List<Widget>? actions,
  final bool hideLeadign = false,
  final Color? bgColor,
  final Color? sftColor,
}) {
  return AppBar(
    backgroundColor: bgColor ?? white,
    titleSpacing: hideLeadign ? null : 3,
    surfaceTintColor: sftColor,
    actions: actions != null ? actions + [widthSpace12] : null,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    leading: hideLeadign
        ? null
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                InkWell(onTap: Get.back, child: Image.asset(Images.backButton)),
          ),
    title: CustomText.qText(title ?? 'customAppBar',
        size: 20, weight: FontWeight.w700, color: ColorConstants.deleteColor),
  );
}
