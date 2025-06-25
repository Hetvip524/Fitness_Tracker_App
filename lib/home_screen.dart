import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';
import 'login_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String email;
  final void Function(bool)? onThemeChanged;
  final bool isDarkMode;
  const HomeScreen({Key? key, required this.name, required this.email, this.onThemeChanged, this.isDarkMode = false}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late String _name;
  late String _email;
  String _phone = '+91 234 567 890';
  String _age = '20';
  String _level = 'Intermediate';
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _email = widget.email;
    _buildScreens();
  }

  void _buildScreens() {
    _screens = [
      MenuView(
        userName: _name,
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged ?? (_) {},
      ),
      ProfileScreen(
        name: _name,
        email: _email,
        phone: _phone,
        age: _age,
        level: _level,
        onEditProfile: (newName, newEmail, newPhone, newAge, newLevel) {
          setState(() {
            _name = newName;
            _email = newEmail;
            _phone = newPhone;
            _age = newAge;
            _level = newLevel;
            _buildScreens();
          });
        },
        onLogout: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen(onThemeChanged: widget.onThemeChanged, isDarkMode: widget.isDarkMode)),
            (route) => false,
          );
        },
      ),
      SettingsScreen(
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged ?? (_) {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}