import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main.dart';
import 'widget.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    print(" from page $stats");

    return BlocProvider(
      create: (_) => ColorBloc(),
      child: const BlocExampleView(),
    );
  }
}

class BlocExampleView extends StatelessWidget {
  const BlocExampleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const StaticTextWidget(),
          const SizedBox(height: 20),
          BlocBuilder<ColorBloc, ColorState>(
            builder: (context, state) {
              return ColoredTextWidget(color: state.color);
            },
            buildWhen: (previous, current) => current.color != previous.color,
          ),
          const SizedBox(height: 20),
          ColorSelectorWidget(
            onColorSelected: (color) =>
                context.read<ColorBloc>().add(ChangeColor(color)),
          ),
        ],
      ),
    );
  }
}

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.initial()) {
    on<ChangeColor>(
      (event, emit) {
        emit(ColorState(color: event.color));
      },
    );
  }
}

abstract class ColorEvent {}

class ChangeColor extends ColorEvent {
  final Color color;
  ChangeColor(this.color);
}

class ColorState {
  final Color color;

  ColorState({required this.color});

  factory ColorState.initial() {
    return ColorState(color: Colors.black);
  }
}
