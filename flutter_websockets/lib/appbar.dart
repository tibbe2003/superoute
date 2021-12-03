import 'package:flutter/material.dart';

class bar extends StatelessWidget implements PreferredSizeWidget {
  const bar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 95,
      backgroundColor: Colors.white,
      title: Center(
        child: Image.asset(
          'image/superroutelogo.png',
          height: 119,
          width: 179,
        ),
      ),
    );
  }
}
