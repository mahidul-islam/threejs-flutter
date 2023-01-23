import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:threejs/app/lib/echarts/flutter_echarts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EChartWidget extends StatelessWidget {
  const EChartWidget({
    super.key,
    this.optionScript = '',
    this.extraScript = '',
    this.interactive = true,
    this.getSetStateJS,
    this.height = 232,
    this.onMessage,
    this.getControllerReference,
  });

  final String optionScript;
  final String extraScript;
  final bool interactive;
  final Function(Function(String))? getSetStateJS;
  final Function(WebViewXController)? getControllerReference;
  final Function(String)? onMessage;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: height ?? Get.height,
      child: Echarts(
        getSetStateJS: getSetStateJS,
        getControllerReference: getControllerReference,
        captureAllGestures: false,
        captureVerticalGestures: false,
        captureHorizontalGestures: false,
        option: utf8.decode(base64.decode(optionScript)),
        extraScript: utf8.decode(base64.decode(extraScript)),
        onMessage: onMessage,
      ),
    );
  }
}
