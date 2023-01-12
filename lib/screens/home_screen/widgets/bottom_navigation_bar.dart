import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      selectedColorOpacity: 0.15,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      duration: const Duration(seconds: 1),
      items: [
        SalomonBottomBarItem(
          icon: Icon(
            Icons.message,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset.fromDirection(1, 1),
                blurRadius: 1,
              ),
            ],
          ),
          title: const Text('Messages'),
        ),
        SalomonBottomBarItem(
          icon: Icon(
            Icons.notifications,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset.fromDirection(1, 1),
                blurRadius: 1,
              ),
            ],
          ),
          title: const Text('Notifications'),
        ),
        SalomonBottomBarItem(
          icon: Icon(
            Icons.settings,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset.fromDirection(1, 1),
                blurRadius: 1,
              ),
            ],
          ),
          title: const Text('Settings'),
        ),
      ],
    );
  }
}
