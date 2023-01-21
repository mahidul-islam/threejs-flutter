import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:threejs/app/lib/echarts/flutter_echarts.dart';

class EChartWidget extends StatelessWidget {
  const EChartWidget({
    super.key,
    this.optionScript = '',
    this.extraScript = '',
    this.interactive = true,
  });

  final String optionScript;
  final String extraScript;
  final bool interactive;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !interactive,
      child: Echarts(
        captureAllGestures: false,
        captureVerticalGestures: false,
        captureHorizontalGestures: false,
        option: utf8.decode(base64.decode(optionScript)),
        extraScript: utf8.decode(base64.decode(extraScript)),
      ),
    );
  }
}
