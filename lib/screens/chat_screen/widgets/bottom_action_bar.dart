import 'package:flutter/material.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    Key? key,
    required this.chatController,
  }) : super(key: key);

  final TextEditingController chatController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8.0,
        left: 8.0,
        top: 8.0,
        bottom: 8.0 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: TextFormField(
        controller: chatController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.cyan,
            ),
            child: IconButton(
              style: IconButton.styleFrom(),
              onPressed: () {
                //Navigator.of(context).pop();
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
    );
  }
}
