import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utils/app_imports.dart';

class AppLoader {
  static bool _isShowing = false;
  static bool get isShowing => _isShowing;

  static void show({String? message, bool canClose = true}) {
    if (_isShowing) return;
    _isShowing = true;

    Get.dialog(
      PopScope(
        canPop: canClose,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: IntrinsicHeight(
              child: IntrinsicWidth(
                child: Container(
                  // width: 100,
                  padding: message == null
                      ? const EdgeInsets.all(20)
                      : const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppDimentions.defaultBoxRadius,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _loaderAnimation(),
                      if (message != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          message,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black38,
    ).then((_) {
      _isShowing = false;
    });
  }

  static Future<void> close() async {
    if (_isShowing && Get.isDialogOpen == true) {
      Get.back();
      _isShowing = false;
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  static Widget widget({
    String? message,
    double? size,
    Color? color1,
    Color? color2,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _loaderAnimation(size: size, color1: color1, color2: color2),
          if (message != null) CustomText.qText(message),
        ],
      ),
    );
  }
}

Widget _loaderAnimation({double? size, Color? color1, Color? color2}) {
  return SpinKitFadingCircle(
    size: size ?? 50,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index.isEven
              ? color1 ?? ColorConstants.indictorColor
              : color2 ?? ColorConstants.selctedColor,
        ),
      );
    },
  );
}
