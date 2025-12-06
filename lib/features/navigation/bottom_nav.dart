import 'package:flutter/material.dart';

class MainBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const MainBottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xFFFF9300),
      unselectedItemColor: Colors.grey,
      backgroundColor: Theme.of(context).colorScheme.background,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
        BottomNavigationBarItem(icon: Icon(Icons.style), label: 'Templates'),
        BottomNavigationBarItem(icon: Icon(Icons.drafts), label: 'Drafts'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
