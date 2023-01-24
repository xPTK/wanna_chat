import 'package:flutter/material.dart';
import 'package:wanna_chat/global_widgets/avatar.dart';
import 'package:wanna_chat/models/export.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  final MessageModel messageModel;
  final TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Avatar.medium(url: messageModel.profileImageUrl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    messageModel.senderName,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: null,
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: chatController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              suffixIcon: Container(
                height: 60,
                width: 60,
                constraints: BoxConstraints.tightForFinite(),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
                child: IconButton(
                  style: IconButton.styleFrom(),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.photo_camera),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.photo),
                  ),
                ],
              ),
              labelText: 'Type your message...',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
