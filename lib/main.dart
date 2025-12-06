import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/navigation/bottom_nav.dart';

void main() {
  runApp(const MagazineMakerApp());
}

class MagazineMakerApp extends StatelessWidget {
  const MagazineMakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine Maker',
      theme: appDarkTheme,
      home: const MainNavigationShell(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});
  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    CreateMagazineScreen(),
    TemplatesScreen(),
    DraftsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: MainBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Center(child: Text('Home', style: Theme.of(context).textTheme.headlineMedium));
}

class CreateMagazineScreen extends StatelessWidget {
  const CreateMagazineScreen({super.key});
  @override
  Widget build(BuildContext context) => Center(child: Text('Create Magazine', style: Theme.of(context).textTheme.headlineMedium));
}

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});
  @override
  Widget build(BuildContext context) => Center(child: Text('Templates', style: Theme.of(context).textTheme.headlineMedium));
}

class DraftsScreen extends StatelessWidget {
  const DraftsScreen({super.key});
  @override
  Widget build(BuildContext context) => Center(child: Text('Drafts', style: Theme.of(context).textTheme.headlineMedium));
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => Center(child: Text('Settings', style: Theme.of(context).textTheme.headlineMedium));
}
