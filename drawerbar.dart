import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = ['Birthdays', 'Gratitude', 'Reminders', 'Setting'];
  final List<IconData> _icons = [Icons.cake, Icons.sentiment_satisfied, Icons.alarm, Icons.settings];
  final List<Color> _colors = [Colors.orange, Colors.green, Colors.purple, Colors.grey];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/nature.jpg'), // 🌿 Background image
                  fit: BoxFit.cover,
                ),
              ),
              accountName: Text(
                'waleed bin naeem',
                style: TextStyle(
                  color: Colors.black, // 👈 Changed to black
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'waleed bin naeem@domainname.com',
                style: TextStyle(
                  color: Colors.black, // 👈 Changed to black
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 223, 221, 221),
                child: Icon(Icons.tag_faces, color: Colors.blue, size: 40),
              ),
            ),
            DrawerItem(icon: Icons.cake, text: 'Birthdays', onTap: () => _onItemTap(0)),
            DrawerItem(icon: Icons.sentiment_satisfied, text: 'Gratitude', onTap: () => _onItemTap(1)),
            DrawerItem(icon: Icons.alarm, text: 'Reminders', onTap: () => _onItemTap(2)),
            DrawerItem(icon: Icons.settings, text: 'Setting', onTap: () => _onItemTap(3)),
          ],
        ),
      ),
      body: Center(
        child: Icon(
          _icons[_selectedIndex],
          size: 120,
          color: _colors[_selectedIndex],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const DrawerItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
