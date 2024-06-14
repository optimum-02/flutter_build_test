import 'package:build_test/main.dart';
import 'package:flutter/material.dart';

class StaticTextWidget extends StatelessWidget {
  const StaticTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    stats["1"] = stats["1"]! + 1;
    return const Text('Test de build dans Flutter');
  }
}

class ColoredTextWidget extends StatelessWidget {
  final Color color;

  const ColoredTextWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    stats["2"] = stats["2"]! + 1;

    return Text(
      'La couleur sélectionnée',
      style: TextStyle(color: color),
    );
  }
}

class ColorSelectorWidget extends StatelessWidget {
  final ValueChanged<Color> onColorSelected;

  const ColorSelectorWidget({super.key, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    stats["3"] = stats["3"]! + 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            onColorSelected(Colors.blue);
            print(stats);
          },
          child: const Card(
              color: Colors.blue, child: SizedBox(width: 50, height: 50)),
        ),
        GestureDetector(
          onTap: () {
            onColorSelected(Colors.red);
            print(stats);
          },
          child: const Card(
              color: Colors.red, child: SizedBox(width: 50, height: 50)),
        ),
        GestureDetector(
          onTap: () {
            onColorSelected(Colors.green);
            print(stats);
          },
          child: const Card(
              color: Colors.green, child: SizedBox(width: 50, height: 50)),
        ),
      ],
    );
  }
}
