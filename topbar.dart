import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ------------------- Home Page -------------------

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String gratitude = '...';

  void _openGratitudePage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GratitudePage()),
    );

    if (result != null) {
      setState(() {
        gratitude = result;
      });
    }
  }

  void _openAboutPage() {
    showDialog(
      context: context,
      builder: (context) => const AboutDialogPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _openAboutPage,
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Grateful for: $gratitude',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openGratitudePage,
        child: const Icon(Icons.edit),
      ),
    );
  }
}

// ------------------- Gratitude Page -------------------

class GratitudePage extends StatefulWidget {
  const GratitudePage({super.key});

  @override
  State<GratitudePage> createState() => _GratitudePageState();
}

class _GratitudePageState extends State<GratitudePage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gratitude'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (selectedValue != null) {
                Navigator.pop(context, selectedValue);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            title: const Text('Family'),
            value: 'Family',
            groupValue: selectedValue,
            onChanged: (value) => setState(() => selectedValue = value),
          ),
          RadioListTile<String>(
            title: const Text('Friends'),
            value: 'Friends',
            groupValue: selectedValue,
            onChanged: (value) => setState(() => selectedValue = value),
          ),
          RadioListTile<String>(
            title: const Text('Coffee'),
            value: 'Coffee',
            groupValue: selectedValue,
            onChanged: (value) => setState(() => selectedValue = value),
          ),
        ],
      ),
    );
  }
}

// ------------------- About Page -------------------

class AboutDialogPage extends StatelessWidget {
  const AboutDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('About'),
      content: const Text('This app demonstrates navigation and state passing in Flutter.'),
      actions: [
        TextButton(
          child: const Text('Close'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
