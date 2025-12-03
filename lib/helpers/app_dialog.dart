import '../utils/app_imports.dart';

class AppDialog {
  static Future<bool?> show({
    required String title,
    required String message,
    String confirmText = 'OK',
    String? cancelText,
    bool showCancelButton = true,
    bool barrierDismissible = false,
  }) async {
    if (Get.isDialogOpen ?? false) return null; // avoid duplicate dialogs

    final result = await Get.dialog<bool>(
      PopScope(
        canPop: barrierDismissible,
        child: Dialog(
          backgroundColor: white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.qText(title, size: 18),
                heightSpace5,
                Text(
                  message,
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (showCancelButton && cancelText != null)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.selectedColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () => Get.back(result: false),
                        child: CustomText.qText(cancelText, color: white),
                      ),
                    widthSpace10,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.textColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () => Get.back(result: true),
                      child: CustomText.qText(confirmText, color: white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black38,
    );

    return result;
  }

  static Future<void> info(String message, {String title = 'Info'}) async {
    await show(
      title: title,
      message: message,
      confirmText: 'OK',
      showCancelButton: false,
    );
  }

  static Future<bool> confirm({
    required String message,
    String title = 'Confirm',
    String confirmText = 'Yes',
    String cancelText = 'No',
    bool barrierDismissible = true,
  }) async {
    final result = await show(
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      showCancelButton: true,
      barrierDismissible: barrierDismissible,
    );
    return result ?? false;
  }

  static Future<void> error(String message, {String title = 'Error'}) async {
    await show(
      title: title,
      message: message,
      confirmText: 'Close',
      showCancelButton: false,
    );
  }
}
