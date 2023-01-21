import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:threejs/app/shared/code_box.dart';
import 'package:threejs/app/shared/echart_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: PageView(
        controller: controller.pageController,
        children: <Widget>[
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 900),
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: InnerField(
                    codeController: controller.codeController,
                    styles: controller.styles,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 300,
              child: EChartWidget(
                interactive: true,
                optionScript: controller.optionScript.value,
                extraScript: controller.extraScript.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
