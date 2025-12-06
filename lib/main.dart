import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:magazinemaker/core/theme/app_theme.dart';
import 'features/navigation/bottom_nav.dart';

// TEMP Screens (until real ones replace them)
import 'features/home/home_screen.dart';
import 'features/create/create_magazine_screen.dart';
import 'features/templates/templates_screen.dart';
import 'features/drafts/drafts_screen.dart';
import 'features/settings/settings_screen.dart';

import 'services/draft_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive local storage
  await Hive.initFlutter();
  DraftRepository.registerAdapters();
  await DraftRepository.ensureBoxesOpen();

  runApp(
    const ProviderScope(
      child: MagazineMakerApp(),
    ),
  );
}

class MagazineMakerApp extends ConsumerWidget {
  const MagazineMakerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Magazine Maker',
      debugShowCheckedModeBanner: false,
      theme: appDarkTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.dark,
      home: const MainNavigationShell(),
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

  final List<Widget> _screens = const [
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
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: MainBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
