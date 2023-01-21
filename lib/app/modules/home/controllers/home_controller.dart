import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final TextEditingController editorController = TextEditingController();

  @override
  void onInit() {
    optionScript.value = optionController.text;
    extraScript.value = extraController.text;
    super.onInit();
  }
}
