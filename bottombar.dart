import 'package:flutter/material.dart';

void main() {
  runApp(const BottomNavApp());
}

class BottomNavApp extends StatelessWidget {
  const BottomNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationBar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BottomNavHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavHome extends StatefulWidget {
  const BottomNavHome({super.key});

  @override
  State<BottomNavHome> createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(
      child: Icon(Icons.cake, color: Colors.orange, size: 120),
    ),
    Center(
      child: Icon(Icons.sentiment_satisfied, color: Colors.green, size: 120),
    ),
    Center(
      child: Icon(Icons.alarm, color: Colors.purple, size: 120),
    ),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.cake),
      label: 'Birthdays',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sentiment_satisfied),
      label: 'Gratitude',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.alarm),
      label: 'Reminders',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _navItems,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
