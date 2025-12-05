import '../../utils/app_imports.dart';

class AppRefreshIndicator extends StatelessWidget {
  final bool error;
  final RefreshCallback onRefresh;
  final Size? size;
  final String? message;
  final Widget? child;
  const AppRefreshIndicator({
    super.key,
    this.error = false,
    required this.onRefresh,
    this.size,
    this.message,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size1 = size ?? MediaQuery.of(context).size;
    final content = error
        ? ListView(
            children: [
              SizedBox(
                height: size1.height,
                child: Center(
                  child: CustomText.pText(message ?? 'No data available.'),
                ),
              ),
            ],
          )
        : child;
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: ColorConstants.selectedColor,
      child: content ?? ListView(),
    );
  }
}
