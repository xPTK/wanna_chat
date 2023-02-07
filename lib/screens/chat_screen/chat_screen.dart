import 'package:flutter/material.dart';
import 'package:wanna_chat/global_widgets/avatar.dart';
import 'package:wanna_chat/models/export.dart';
import 'package:wanna_chat/screens/chat_screen/widgets/export.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  final MessageModel messageModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController chatController = TextEditingController();
  late ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      listScrollController
          .jumpTo(listScrollController.position.maxScrollExtent);
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Avatar.medium(url: widget.messageModel.profileImageUrl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    widget.messageModel.senderName,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                print(listScrollController.position);
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: ListView(
          controller: listScrollController,
          //controller: FixedExtentScrollController(initialItem: itemIndex);
          children: [
            DateLabel(label: 'Yesterday'),
            MessageTile(
              message: 'Hi, how you doin\'?',
              messageDate: '10:00',
            ),
            MyMessageTile(
              message: 'Hello. I\'m doing good.',
              messageDate: '12:01',
            ),
            DateLabel(label: 'Today'),
            MessageTile(
              message: 'Hello, what\'s up?',
              messageDate: '12:00',
            ),
            MyMessageTile(
              message: 'Hi!',
              messageDate: '12:01',
            ),
            MyMessageTile(
              message: 'I\'m fine thanks.',
              messageDate: '12:01',
            ),
            MyMessageTile(
              message: 'I\'m fine thanks.',
              messageDate: '12:01',
            ),
          ],
        ),
        bottomNavigationBar: BottomActionBar(chatController: chatController),
      ),
    );
  }
}

class DateLabel extends StatelessWidget {
  const DateLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                messageDate,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMessageTile extends StatelessWidget {
  const MyMessageTile({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                messageDate,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
