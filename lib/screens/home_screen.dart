import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wanna_chat/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _storyController;

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
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
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
        drawer: Drawer(
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
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    shape: StadiumBorder(),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(Icons.photo_camera),
                          ),
                        ),
                        Text('Conversation $index'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Icon(
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset.fromDirection(2, 2),
                        blurRadius: 5,
                      ),
                    ],
                    Icons.message,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                height: 25,
                width: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset.fromDirection(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                  Icons.call,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Container(
                color: Colors.grey,
                height: 25,
                width: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset.fromDirection(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Container(
                color: Colors.grey,
                height: 25,
                width: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Icon(
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset.fromDirection(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
