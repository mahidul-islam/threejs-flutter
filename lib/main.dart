import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:threejs/app/shared/bottom_sheet_util.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(BottomSheetUtil());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
