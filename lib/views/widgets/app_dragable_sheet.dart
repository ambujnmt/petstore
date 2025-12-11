import '../../utils/app_imports.dart';

class AppFixedBottomBar extends StatefulWidget {
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
  State<AppFixedBottomBar> createState() => _AppFixedBottomBarState();
}

class _AppFixedBottomBarState extends State<AppFixedBottomBar> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Your main screen content here
          Center(
              child: SizedBox(
                  height: Get.height, width: Get.width, child: widget.body)),

          // Draggable Bottom Bar
          DraggableScrollableSheet(
            controller: sheetController,
            initialChildSize: widget.initialHeight ??
                (widget.opened
                    ? widget.maxHeight
                    : widget.minHeight), // initial height (15% of screen)
            minChildSize:
                widget.minHeight, // cannot go below this (prevents closing)
            maxChildSize: widget.maxHeight, // max draggable height
            snap: true,
            snapSizes: [widget.minHeight, widget.maxHeight],
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(widget.radiusValue ?? 0)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 8,
                      color: black.withValues(alpha: .05),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onVerticalDragUpdate: (details) {
                        sheetController.jumpTo(
                          (sheetController.size -
                                  details.primaryDelta! / Get.height)
                              .clamp(widget.minHeight, widget.maxHeight),
                        );
                      },
                      onVerticalDragEnd: (details) {
                        double velocity = details.primaryVelocity ?? 0;
                        if (velocity > 800) {
                          sheetController.animateTo(
                            widget.minHeight,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                          );
                          return;
                        }

                        if (velocity < -800) {
                          sheetController.animateTo(
                            widget.maxHeight,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                          );
                          return;
                        }
                        double mid = (widget.minHeight + widget.maxHeight) / 2;
                        double target = sheetController.size > mid
                            ? widget.maxHeight
                            : widget.minHeight;
                        sheetController.animateTo(
                          target,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                        );
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppDimentions.screenPaddingS),
                          child: SizedBox(
                            width: 50,
                            height: 5,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          controller: scrollController,
                          padding: AppDimentions.defaultScreenPadding,
                          children: widget.sliderWidgets ?? [],
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
