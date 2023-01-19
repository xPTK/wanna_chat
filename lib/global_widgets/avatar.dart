import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.radius,
    required this.url,
  });

  const Avatar.small({
    super.key,
    required this.url,
  }) : radius = 24;

  const Avatar.medium({
    super.key,
    required this.url,
  }) : radius = 48;

  const Avatar.large({
    super.key,
    required this.url,
  }) : radius = 72;

  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.purple,
      backgroundImage: CachedNetworkImageProvider(
        url,
        errorListener: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              margin: EdgeInsets.all(8.0),
              behavior: SnackBarBehavior.floating,
              content: Text('Failed to load images. '
                'Check your Internet connection.'),
              duration: Duration(seconds: 3),
              shape: StadiumBorder(),
              backgroundColor: Colors.purple,
            ),
          );
        },
      ),
    );
  }
}
