import 'dart:convert';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/all.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:threejs/app/shared/bottom_sheet_content.dart';
import 'package:threejs/app/shared/bottom_sheet_util.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomeController extends GetxController {
  RxString optionScript =
      'eyB4QXhpczogeyB0eXBlOiAnY2F0ZWdvcnknLCBkYXRhOiBbJ01vbicsICdUdWUnLCAnV2VkJywgJ1RodScsICdGcmknLCAnU2F0JywgJ1N1biddIH0sIHlBeGlzOiB7IHR5cGU6ICd2YWx1ZScgfSwgc2VyaWVzOiBbIHsgZGF0YTogbGlzdERhdGEsIHR5cGU6ICdsaW5lJyB9IF19'
          .obs;
  RxString extraScript =
      'dmFyIGxpc3REYXRhID0gWzEwNTAsIDIzMCwgMjI0LCAyMTgsIDEzNSwgMTQ3LCAyNjBdOw=='
          .obs;

  RxDouble graphWidth = 500.0.obs;
  RxDouble graphHeight = 400.0.obs;

  void getHeight() {
    BottomSheetUtil.to.showConfirm(
      child: BottomSheetContent.intSingleNumberSpinner(
        number: graphHeight,
        unit: 'px',
        minNumber: 100,
        maxNumber: 1000,
      ),
      title: 'Height',
      description: '',
      showConfirmButton: false,
    );
  }

  void getDefault() {
    graphHeight.value = 400.0;
    graphWidth.value = 500.0;
  }

  void getWidth() {
    BottomSheetUtil.to.showConfirm(
      child: BottomSheetContent.intSingleNumberSpinner(
        number: graphWidth,
        unit: 'px',
        minNumber: 100,
        maxNumber: 1000,
      ),
      title: 'Width',
      description: '',
      showConfirmButton: false,
    );
  }

  WebViewXController? webController;

  Function(String)? setStateJS;

  void getSetStateJS(Function(String) func) {
    setStateJS = func;
  }

  void getWebControllerReference(WebViewXController controller) {
    webController = controller;
  }

  final CodeController buttonCodeController = CodeController(
    text: '''
listData.pop();
''',
    // 'function \$initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class="\${cls}"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n\n  return (\n    <div>\n      <web-component>{block}</web-component>\n    </div>\n  )\n}\n\nexport  \$initHighlight;\n',
    patternMap: {
      r"\B#[a-zA-Z0-9]+\b": const TextStyle(color: Colors.red),
      r"\B@[a-zA-Z0-9]+\b": const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.blue,
      ),
      r"\B![a-zA-Z0-9]+\b":
          const TextStyle(color: Colors.yellow, fontStyle: FontStyle.italic),
    },
    stringMap: {
      "bev": const TextStyle(color: Colors.indigo),
    },
    language: allLanguages['javascript'],
  );

  final CodeController optionCodeController = CodeController(
    text: '''
{
    xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    yAxis: {
        type: 'value'
    },
    series: [{
        data: listData,
        type: 'line'
    }]
}
''',
    // 'function \$initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class="\${cls}"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n\n  return (\n    <div>\n      <web-component>{block}</web-component>\n    </div>\n  )\n}\n\nexport  \$initHighlight;\n',
    patternMap: {
      r"\B#[a-zA-Z0-9]+\b": const TextStyle(color: Colors.red),
      r"\B@[a-zA-Z0-9]+\b": const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.blue,
      ),
      r"\B![a-zA-Z0-9]+\b":
          const TextStyle(color: Colors.yellow, fontStyle: FontStyle.italic),
    },
    stringMap: {
      "bev": const TextStyle(color: Colors.indigo),
    },
    language: allLanguages['javascript'],
  );

  final CodeController extraCodeController = CodeController(
    text: '''
var listData = [1050, 230, 224, 218, 135, 147, 260];
''',
    // 'function \$initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class="\${cls}"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n\n  return (\n    <div>\n      <web-component>{block}</web-component>\n    </div>\n  )\n}\n\nexport  \$initHighlight;\n',
    patternMap: {
      r"\B#[a-zA-Z0-9]+\b": const TextStyle(color: Colors.red),
      r"\B@[a-zA-Z0-9]+\b": const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.blue,
      ),
      r"\B![a-zA-Z0-9]+\b":
          const TextStyle(color: Colors.yellow, fontStyle: FontStyle.italic),
    },
    stringMap: {
      "bev": const TextStyle(color: Colors.indigo),
    },
    language: allLanguages['javascript'],
  );

  final Map<String, TextStyle> styles = vsTheme;

  void render() {
    optionScript.value =
        base64.encode(utf8.encode(optionCodeController.text.trim()));
    extraScript.value =
        base64.encode(utf8.encode(extraCodeController.text.trim()));
    futureCall();
  }

  Future<void> futureCall() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    // webController?.evalRawJavascript('2+2');
    // setStateJS?.call('');
  }

  Future<void> buttonOnPressed() async {
    webController?.evalRawJavascript(buttonCodeController.text.trim());
    setStateJS?.call('');
  }

  @override
  void onInit() {
    render();
    super.onInit();
  }
}
