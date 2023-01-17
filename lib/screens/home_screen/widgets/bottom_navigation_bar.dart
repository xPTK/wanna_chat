import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      selectedColorOpacity: 0.15,
      unselectedItemColor: Colors.grey,
      currentIndex: index,
      duration: const Duration(seconds: 1),
      onTap: (navItem) {
        widget.onItemSelected(navItem);
        setState(() {
          index = navItem;
        });
      },
      items: [
        SalomonBottomBarItem(
          icon: Icon(
            Icons.message,
            shadows: [
              buildShadow(),
            ],
          ),
          title: const Text('Messages'),
        ),
        SalomonBottomBarItem(
          icon: Icon(
            Icons.notifications,
            shadows: [
              buildShadow(),
            ],
          ),
          title: const Text('Notifications'),
        ),
        SalomonBottomBarItem(
          icon: Icon(
            Icons.settings,
            shadows: [
              buildShadow(),
            ],
          ),
          title: const Text('Settings'),
        ),
      ],
    );
  }

  Shadow buildShadow() {
    return Shadow(
      color: Colors.black,
      offset: Offset.fromDirection(1, 1),
      blurRadius: 1,
    );
  }
}
