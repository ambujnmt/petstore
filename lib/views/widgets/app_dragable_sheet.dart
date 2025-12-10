import '../../utils/app_imports.dart';

class AppFixedBottomBar extends StatelessWidget {
  final Widget? body;
  final List<Widget>? sliderWidgets;
  final double? radiusValue;
  final double minHeight;
  final double maxHeight;
  final double? initialHeight;
  final bool opened;
  const AppFixedBottomBar({
    super.key,
    this.body,
    this.sliderWidgets,
    this.radiusValue,
    this.minHeight = 0.28,
    this.maxHeight = 0.75,
    this.initialHeight,
    this.opened = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Your main screen content here
          Center(
              child:
                  SizedBox(height: Get.height, width: Get.width, child: body)),

          // Draggable Bottom Bar
          DraggableScrollableSheet(
            initialChildSize: initialHeight ??
                (opened
                    ? maxHeight
                    : minHeight), // initial height (15% of screen)
            minChildSize: minHeight, // cannot go below this (prevents closing)
            maxChildSize: maxHeight, // max draggable height
            snap: true,
            snapSizes: [minHeight, maxHeight],
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(radiusValue ?? 0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 8,
                        color: black.withValues(alpha: .05)),
                  ],
                ),
                child: Column(
                  children: [
                    heightSpace8,
                    const Center(
                      child: SizedBox(
                        width: 50,
                        height: 5,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    heightSpace8,
                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          controller: scrollController,
                          padding: AppDimentions.defaultScreenPadding,
                          children: sliderWidgets ?? [],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
