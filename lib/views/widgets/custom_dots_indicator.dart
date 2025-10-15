import '../../utils/app_imports.dart';

Widget customDotsIndicator(
    {double? iconsSize, int? length, int currentIndex = 1}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length ?? 3, (index) {
        final isActive = currentIndex == index;
        return Container(
          padding: const EdgeInsets.all(1.4),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: const BoxDecoration(shape: BoxShape.circle, color: white),
          child: Icon(
            Icons.circle,
            size: iconsSize ?? 10,
            color: isActive ? ColorConstants.selctedColor : white,
          ),
        );
      }),
    ),
  );
}
