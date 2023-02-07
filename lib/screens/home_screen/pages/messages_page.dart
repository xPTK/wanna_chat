import 'package:flutter/material.dart';

import '../widgets/export.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        HomeAppBar(),
        Conversations(),
      ],
    );
  }
}
