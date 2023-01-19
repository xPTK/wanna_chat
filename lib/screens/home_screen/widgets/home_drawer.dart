import 'package:flutter/material.dart';
import 'package:wanna_chat/global_widgets/avatar.dart';
import 'package:wanna_chat/helpers.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.9,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Avatar.large(url: Helpers.randomImageUrl()),
          ],
        ),
      ),
    );
  }
}