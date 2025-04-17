import 'package:flutter/material.dart';

void main() {
  runApp(const HeroCycleApp());
}

class HeroCycleApp extends StatelessWidget {
  const HeroCycleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation Cycle',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HeroCyclePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HeroCyclePage extends StatefulWidget {
  const HeroCyclePage({super.key});

  @override
  State<HeroCyclePage> createState() => _HeroCyclePageState();
}

class _HeroCyclePageState extends State<HeroCyclePage> {
  int _stateIndex = 0;

  final List<Alignment> _positions = [
    Alignment.topLeft,
    Alignment.center,
  ];

  void _handleTap() async {
    if (_stateIndex == 0) {
      setState(() => _stateIndex = 1); // Move to center
    } else if (_stateIndex == 1) {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const FlyPage()),
      );
      if (result == 'reset') {
        setState(() => _stateIndex = 0); // Back to top-left
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation')),
      body: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            alignment: _positions[_stateIndex],
            child: GestureDetector(
              onTap: _handleTap,
              child: Hero(
                tag: 'paint',
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.format_paint,
                    color: Colors.lightGreen,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlyPage extends StatelessWidget {
  const FlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fly')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context, 'reset'); // Tell main page to reset
          },
          child: Hero(
            tag: 'paint',
            child: Icon(
              Icons.format_paint,
              color: Colors.lightGreen,
              size: 150,
            ),
          ),
        ),
      ),
    );
  }
}
