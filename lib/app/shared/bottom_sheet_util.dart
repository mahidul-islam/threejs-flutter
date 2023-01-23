import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threejs/app/shared/bottom_sheet_container.dart';

class BottomSheetUtil extends GetxService {
  static BottomSheetUtil get to => Get.find();
  RoundedRectangleBorder get defaultShape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      );

  void showRaw({
    required Widget child,
    bool isDismissible = true,
    double? elevation,
    RoundedRectangleBorder? shape,
  }) {
    Get.bottomSheet(
      BottomSheetContainer(child: child),
      shape: shape ?? defaultShape,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      elevation: elevation,
    );
  }

  Future<void> showConfirm({
    required String title,
    String description = '',
    Widget? header,
    String buttonTitle = 'OK',
    Widget? child,
    bool isDismissible = true,
    bool isDisabled = false,
    double? elevation,
    RoundedRectangleBorder? shape,
    VoidCallback? onPressed,
    bool isScrollControlled = true,
    bool showConfirmButton = true,
    bool enableDrag = true,
  }) async {
    await Get.bottomSheet(
      BottomSheetContainer.confirm(
        header: header,
        title: title,
        description: description,
        buttonTitle: buttonTitle,
        onPressed: onPressed,
        showConfirmButton: showConfirmButton,
        isDisabled: isDisabled,
        child: child,
      ),
      shape: shape ?? defaultShape,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      elevation: elevation,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
    );
  }
}
