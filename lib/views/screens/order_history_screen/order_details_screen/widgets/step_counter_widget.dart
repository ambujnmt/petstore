import 'package:pinkpawscat/utils/app_imports.dart';

class HorizontalStepTracker extends StatelessWidget {
  final int maxSteps;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor;
  final double circleSize;
  final double lineHeight;

  HorizontalStepTracker({
    super.key,
    this.maxSteps = 4,
    this.currentStep = 1,
    this.activeColor = ColorConstants.selectedColor,
    Color? inactiveColor,
    this.circleSize = 18,
    this.lineHeight = 3,
  }) : inactiveColor = inactiveColor ?? grey[300]!;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxSteps, (i) {
        final isLineActive = i < currentStep - 1;
        final isStepActive = i <= currentStep - 1;
        return maxSteps == i + 1
            ? CustomContainer.lightContainer(
                shape: BoxShape.circle,
                height: 40,
                width: 40,
                hideShadow: true,
                paddingValue: AppDimentions.screenPaddingXXS,
                color: isStepActive ? activeColor : inactiveColor,
                child: isStepActive
                    ? const Icon(
                        Icons.done,
                        color: white,
                      )
                    : null)
            : Expanded(
                child: Row(
                children: [
                  CustomContainer.lightContainer(
                      shape: BoxShape.circle,
                      height: 40,
                      width: 40,
                      hideShadow: true,
                      paddingValue: AppDimentions.screenPaddingXXS,
                      color: isStepActive ? activeColor : inactiveColor,
                      child: isStepActive
                          ? const Icon(
                              Icons.done,
                              color: white,
                            )
                          : null),
                  Expanded(
                    child: Container(
                      height: 3,
                      width: Get.width,
                      color: isLineActive ? activeColor : inactiveColor,
                    ),
                  )
                ],
              ));
      }),
    );
  }
}
