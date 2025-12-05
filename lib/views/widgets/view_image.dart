import 'package:photo_view/photo_view.dart';
import 'package:pinkpawscat/utils/app_imports.dart';

class ViewImage extends StatefulWidget {
  final String imgUrl;
  const ViewImage({super.key, required this.imgUrl});
  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: ''),
      body: (_) => Hero(
        tag: widget.imgUrl.toString(),
        child: CachedNetworkImage(
          height: Get.height,
          width: Get.width,
          fit: BoxFit.contain,
          imageUrl: widget.imgUrl,
          imageBuilder: (context, provider) => PhotoView(
            imageProvider: provider,
            backgroundDecoration: const BoxDecoration(color: white),
          ),
          placeholder: (context, url) => imgPlaceholder(fit: BoxFit.contain),
          errorWidget: (context, url, error) => imgError(fit: BoxFit.contain),
        ),
      ),
    );
  }
}
