import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/all.dart';
import 'package:flutter_highlight/themes/vs.dart';

class HomeController extends GetxController {
  RxString optionScript = ''.obs;
  RxString extraScript = ''.obs;

  final TextEditingController optionController = TextEditingController(
      text:
          'eyB4QXhpczogeyB0eXBlOiAnY2F0ZWdvcnknLCBkYXRhOiBbJ01vbicsICdUdWUnLCAnV2VkJywgJ1RodScsICdGcmknLCAnU2F0JywgJ1N1biddIH0sIHlBeGlzOiB7IHR5cGU6ICd2YWx1ZScgfSwgc2VyaWVzOiBbIHsgZGF0YTogbGlzdERhdGEsIHR5cGU6ICdsaW5lJyB9IF19');
  final TextEditingController extraController = TextEditingController(
      text:
          'dmFyIGxpc3REYXRhID0gWzEwNTAsIDIzMCwgMjI0LCAyMTgsIDEzNSwgMTQ3LCAyNjBdOw==');

  PageController pageController = PageController();

  final CodeController codeController = CodeController(
    text:
        'function \$initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class="\${cls}"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n\n  return (\n    <div>\n      <web-component>{block}</web-component>\n    </div>\n  )\n}\n\nexport  \$initHighlight;\n',
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

  @override
  void onInit() {
    optionScript.value = optionController.text;
    extraScript.value = extraController.text;
    super.onInit();
  }
}
