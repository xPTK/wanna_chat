import 'package:flutter/material.dart';

class ProfileInfoBox extends StatelessWidget {
  const ProfileInfoBox({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan,
      shape: const StadiumBorder(),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset.fromDirection(1, 1),
                  blurRadius: 1,
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}