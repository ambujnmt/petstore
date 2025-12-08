import '../../utils/app_imports.dart';

class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final double? radiusValue;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final String? cacheKey;
  final bool useOldImageOnUrlChange;
  const AppNetworkImage({
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.radiusValue,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.cacheKey,
    this.useOldImageOnUrlChange = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        radiusValue ?? AppDimentions.defaultBoxRadius,
      ),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl ?? '',
        cacheKey: cacheKey,
        useOldImageOnUrlChange: useOldImageOnUrlChange,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) => placeholder ?? imgPlaceholder(fit: fit),
        errorWidget: (context, url, error) => errorWidget ?? imgError(fit: fit),
      ),
    );
  }
}

Widget imgPlaceholder({BoxFit? fit}) {
  return Image.asset(fit: fit ?? BoxFit.cover, Images.imgPlaceholder);
}

Widget imgError({BoxFit? fit}) {
  return Image.asset(fit: fit ?? BoxFit.cover, Images.imgError);
}
