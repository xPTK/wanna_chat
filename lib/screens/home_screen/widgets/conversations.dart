import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wanna_chat/global_widgets/avatar.dart';
import 'package:wanna_chat/helpers.dart';
import 'package:wanna_chat/models/export.dart';
import 'package:wanna_chat/screens/chat_screen.dart';

class Conversations extends StatelessWidget {
  const Conversations({
    Key? key,
    //required this.messageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: ListView.builder(
        itemCount: 15,
        itemExtent: 98,
        itemBuilder: (context, index) {
          return ConversationTile(
            messageModel: MessageModel(
              senderName: Faker().person.name(),
              message: Faker().lorem.sentence(),
              messageDate: DateTime.now(),
              dateMessageUI: Jiffy(Helpers.randomDate()).fromNow(),
              profileImageUrl: Helpers.randomImageUrl(),
            ),
          );
        },
      ),
    );
  }
}

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatScreen(messageModel: messageModel),
        ));
      },
      child: Card(
        color: Colors.white,
        shape: const StadiumBorder(),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Avatar.small(url: messageModel.profileImageUrl),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    messageModel.senderName,
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    messageModel.message,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    messageModel.dateMessageUI,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
