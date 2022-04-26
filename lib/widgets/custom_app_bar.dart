import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
        iconSize: 28,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
          iconSize: 28,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
