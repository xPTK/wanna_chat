import 'package:flutter/material.dart';
import 'package:wanna_chat/screens/home_screen/pages/messages_page.dart';
import 'package:wanna_chat/screens/home_screen/pages/settings_page.dart';
import 'package:wanna_chat/screens/home_screen/widgets/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _storyController;

  List pages = const [
    MessagesPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    _storyController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawerScrimColor: Colors.purple,
        drawer: const HomeDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeAppBar(storyController: _storyController),
            const Conversations(),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
