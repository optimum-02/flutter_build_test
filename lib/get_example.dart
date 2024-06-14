import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';
import 'widget.dart';

class ColorController extends GetxController {
  var selectedColor = Colors.black.obs;

  void updateColor(Color color) {
    selectedColor.value = color;
  }
}

class GetExample extends StatelessWidget {
  const GetExample({super.key});

  @override
  Widget build(BuildContext context) {
    print(" from page $stats");
    final ColorController controller = Get.put(ColorController());
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const StaticTextWidget(),
          const SizedBox(height: 20),
          Obx(() => ColoredTextWidget(color: controller.selectedColor.value)),
          const SizedBox(height: 20),
          ColorSelectorWidget(
            onColorSelected: (color) => controller.updateColor(color),
          ),
        ],
      ),
    );
  }
}
