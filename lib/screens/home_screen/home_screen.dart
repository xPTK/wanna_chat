import 'package:flutter/material.dart';
import 'package:wanna_chat/screens/home_screen/widgets/export.dart';
import 'package:wanna_chat/screens/home_screen/pages/export.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final List pages = const [
    MessagesPage(),
    NotificationsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const HomeDrawer(),
        drawerScrimColor: Colors.cyan,
        body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (context, value, child) {
            print('value: $value');
            return pages[value];
          },
        ),
        bottomNavigationBar: BottomNavBar(
          onItemSelected: (index) {
            pageIndex.value = index;
          },
        ),
      ),
    );
  }
}
