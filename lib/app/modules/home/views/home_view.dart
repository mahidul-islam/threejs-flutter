import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:threejs/app/shared/code_box.dart';
import 'package:threejs/app/shared/echart_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.render(),
          backgroundColor: const Color(0xff0044cc),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xff0044cc),
          title: const Text('Pillar E-chart Debug Tool'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          const Text('Option Script',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32.0),
                            child: InnerField(
                              codeController: controller.optionCodeController,
                              styles: controller.styles,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('Extra Script',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32.0),
                            child: InnerField(
                              codeController: controller.extraCodeController,
                              styles: controller.styles,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          key: UniqueKey(),
                          color: Colors.white,
                          height: 400,
                          width: 500,
                          child: EChartWidget(
                            interactive: true,
                            optionScript: controller.optionScript.value,
                            extraScript: controller.extraScript.value,
                            getControllerReference:
                                controller.getWebControllerReference,
                            getSetStateJS: controller.getSetStateJS,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16),
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              const Text('Option Script Base 64'),
                              const SizedBox(
                                height: 8,
                              ),
                              SelectableText(
                                controller.optionScript.value,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16),
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              const Text('Extra Script Base 64'),
                              const SizedBox(
                                height: 8,
                              ),
                              SelectableText(
                                controller.extraScript.value,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
