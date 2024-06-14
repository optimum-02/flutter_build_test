import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
import 'widget.dart';

final colorProvider = StateProvider<Color>((ref) => Colors.black);

class RiverpodExample extends StatelessWidget {
  const RiverpodExample({super.key});

  @override
  Widget build(BuildContext context) {
    print("from page $stats");

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const StaticTextWidget(),
          const SizedBox(height: 20),
          Consumer(
            builder: (context, ref, child) =>
                ColoredTextWidget(color: ref.watch(colorProvider)),
          ),
          const SizedBox(height: 20),
          Consumer(
            builder: (context, ref, child) => ColorSelectorWidget(
              onColorSelected: (color) {
                ref.read(colorProvider.notifier).state = color;
              },
            ),
          ),
        ],
      ),
    );
  }
}
