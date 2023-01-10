import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
