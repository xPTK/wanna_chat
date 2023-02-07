import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.radius,
    required this.url,
    required this.isActive,
    required this.borderColor,
  });

  const Avatar.small({
    super.key,
    required this.url,
    this.isActive = false,
    this.borderColor = Colors.white,
  }) : radius = 24;

  const Avatar.medium({
    super.key,
    required this.url,
    this.isActive = false,
    this.borderColor = Colors.white,
  }) : radius = 30;

  const Avatar.large({
    super.key,
    required this.url,
    this.isActive = false,
    this.borderColor = Colors.white,
  }) : radius = 72;

  final double radius;
  final String url;
  final bool isActive;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    bool isShowed = false;

    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Colors.cyan,
          backgroundImage: CachedNetworkImageProvider(
            url,
            errorListener: () {
              isShowed == false
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.cyan,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(8.0),
                        duration: Duration(seconds: 3),
                        shape: StadiumBorder(),
                        content: Text('Failed to load images. '
                            'Check your Internet connection.'),
                      ),
                    )
                  : null;

              isShowed = true;
            },
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: borderColor),
                top: BorderSide(width: 1, color: borderColor),
                left: BorderSide(width: 1, color: borderColor),
                right: BorderSide(width: 1, color: borderColor),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: radius * 0.05,
          right: radius * 0.2,
          child: Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.green : Colors.transparent,
              // border: Border(
              //   bottom: BorderSide(width: 0.1, color: Colors.black),
              //   top: BorderSide(width: 0.1, color: Colors.black),
              //   left: BorderSide(width: 0.1, color: Colors.black),
              //   right: BorderSide(width: 0.1, color: Colors.black),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
