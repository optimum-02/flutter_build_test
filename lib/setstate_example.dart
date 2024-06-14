import 'package:flutter/material.dart';

import 'main.dart';
import 'widget.dart';

class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  SetStateExampleState createState() => SetStateExampleState();
}

class SetStateExampleState extends State<SetStateExample> {
  Color _selectedColor = Colors.black;

  void _updateColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(" from page $stats");

    return Scaffold(
      appBar: AppBar(title: const Text('SetState Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const StaticTextWidget(),
          const SizedBox(height: 20),
          ColoredTextWidget(color: _selectedColor),
          const SizedBox(height: 20),
          ColorSelectorWidget(onColorSelected: _updateColor),
        ],
      ),
    );
  }
}
