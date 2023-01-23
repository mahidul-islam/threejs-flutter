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
                          const Text('Button/Toggle',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  child: InnerField(
                                    codeController:
                                        controller.buttonCodeController,
                                    styles: controller.styles,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              MaterialButton(
                                height: 60,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.zero,
                                hoverColor: const Color(0xff0044cc),
                                // splashColor: SGColors.whiteShade1,
                                highlightElevation: 0,
                                color: const Color(0xff0044cc).withOpacity(0.4),
                                onPressed: controller.buttonOnPressed,
                                child: const Text(
                                  'Toggle/\nButton',
                                  style: TextStyle(
                                    color:
                                        //Color(0xff0044cc)
                                        Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text('Option Script',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: InnerField(
                              codeController: controller.optionCodeController,
                              styles: controller.styles,
                            ),
                          ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MaterialButton(
                              height: 48,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hoverColor: const Color(0xff0044cc),
                              // splashColor: SGColors.whiteShade1,
                              highlightElevation: 0,
                              color: const Color(0xff0044cc).withOpacity(0.4),
                              onPressed: controller.getHeight,
                              child: const Text(
                                'Update Height',
                                style: TextStyle(
                                  color:
                                      //Color(0xff0044cc)
                                      Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            MaterialButton(
                              height: 48,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hoverColor: const Color(0xff0044cc),
                              // splashColor: SGColors.whiteShade1,
                              highlightElevation: 0,
                              color: const Color(0xff0044cc).withOpacity(0.4),
                              onPressed: controller.getDefault,
                              child: const Text(
                                'Default',
                                style: TextStyle(
                                  color:
                                      //Color(0xff0044cc)
                                      Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            MaterialButton(
                              height: 48,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              // padding: EdgeInsets.zero,
                              hoverColor: const Color(0xff0044cc),
                              // splashColor: SGColors.whiteShade1,
                              highlightElevation: 0,
                              color: const Color(0xff0044cc).withOpacity(0.4),
                              onPressed: controller.getWidth,
                              child: const Text(
                                'Update Width',
                                style: TextStyle(
                                  color:
                                      //Color(0xff0044cc)
                                      Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          key: UniqueKey(),
                          color: Colors.white,
                          height: controller.graphHeight.value,
                          width: controller.graphWidth.value,
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
                          width: controller.graphWidth.value,
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
                          width: controller.graphWidth.value,
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
