import '../../../../../utils/app_imports.dart';

List<Widget> hsColorDotWidget(String colorHex) {
  return colorHex.isNotEmpty
      ? [
          CustomContainer.lightContainer(
            shape: BoxShape.circle,
            paddingValue: 0,
            child: Icon(
              Icons.circle,
              size: 13,
              color: fromHex(colorHex),
            ),
          ),
          widthSpace4,
        ]
      : [];
}
