import '../../utils/app_imports.dart';

class AppScaffold extends StatelessWidget {
  final Widget? Function(Size size)? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final EdgeInsets safePadding = MediaQuery.of(context).padding;
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? white,
      body: SafeArea(
        child: body != null
            ? (body!(
                  Size(
                    screenSize.width,
                    screenSize.height -
                        safePadding.top -
                        safePadding.bottom -
                        (appBar != null ? appBar!.preferredSize.height : 0),
                  ),
                ) ??
                Container())
            : Container(),
      ),
    );
  }
}
