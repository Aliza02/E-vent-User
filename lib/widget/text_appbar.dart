import 'package:flutter/material.dart';

import '../constants/constant.dart';

class TextAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TextAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: constant.font,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
