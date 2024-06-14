import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'setstate_example.dart';
import 'bloc_example.dart';
import 'riverpod_example.dart';
import 'get_example.dart';

void main() {
  runApp(const MyApp());
}

var stats = {"1": 0, "2": 0, "3": 0, "app": 0, "home": 0};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    stats["app"] = stats["app"]! + 1;

    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    stats["home"] = stats["home"]! + 1;

    return Scaffold(
      appBar: AppBar(title: const Text('State Management Examples')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SetStateExample()),
                );
              },
              child: const Text('SetState Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BlocExample()),
                );
              },
              child: const Text('Bloc Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ProviderScope(child: RiverpodExample())),
                );
              },
              child: const Text('Riverpod Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetExample()),
                );
              },
              child: const Text('GetX Example'),
            ),
          ],
        ),
      ),
    );
  }
}
