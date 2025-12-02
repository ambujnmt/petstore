import '../../utils/app_imports.dart';

AppBar customAppBar({
  final String? title,
  final List<Widget>? actions,
  final bool hideLeadign = false,
}) {
  return AppBar(
    leading: hideLeadign
        ? null
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                InkWell(onTap: Get.back, child: Image.asset(Images.backButton)),
          ),
    titleSpacing: hideLeadign ? null : 3,
    title: CustomText.qText(title ?? 'customAppBar',
        size: 20, weight: FontWeight.w700, color: ColorConstants.deleteColor),
    backgroundColor: white,
    actions: actions != null ? actions + [widthSpace12] : null,
  );
}
