import 'package:flutter/material.dart';
import 'package:wanna_chat/global_widgets/avatar.dart';
import 'package:wanna_chat/helpers.dart';
import 'package:wanna_chat/screens/chat_screen.dart';

class Conversations extends StatelessWidget {
  const Conversations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: ListView.builder(
        itemCount: 15,
        itemExtent: 98,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatScreen(),
              ));
            },
            child: Card(
              color: Colors.white,
              shape: const StadiumBorder(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Avatar.small(url: Helpers.randomImageUrl()),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Conversation $index'),
                      const SizedBox(height: 10),
                      const Text(
                        'Hello!',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
