import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wanna_chat/screens/home_screen/pages/messages_page.dart';
import 'package:wanna_chat/screens/home_screen/pages/settings_page.dart';

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
        appBar: AppBar(
          toolbarHeight: 80,
          title: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
          elevation: 0,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.vertical(
          //     bottom: Radius.circular(25),
          //   ),
          // ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.logout),
              style: IconButton.styleFrom(
                shadowColor: Colors.black,
                elevation: 10,
              ),
            )
          ],
        ),
        drawerScrimColor: Colors.purple,
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     Colors.purple,
                  //     Colors.purple.withOpacity(0.5),
                  //   ],
                  // ),
                  color: Colors.purple,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Active',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: _storyController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CircleAvatar(
                              child: Icon(
                                Icons.photo,
                                size: 40,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: 15,
                itemExtent: 98,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    shape: StadiumBorder(),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircleAvatar(
                            child: Icon(Icons.photo_camera),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Conversation $index'),
                            SizedBox(height: 10),
                            Text(
                              'Hello!',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          selectedColorOpacity: 0.15,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          duration: Duration(seconds: 1),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.purple,
        //   selectedItemColor: Colors.white,
        //   showUnselectedLabels: false,
        //   currentIndex: 0,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.message),
        //       label: 'Messages',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings),
        //       label: 'Settings',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
