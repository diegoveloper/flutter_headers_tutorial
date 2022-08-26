import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _MyCustomAppBar(),
    );
  }
}

class _MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MyCustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Row(
        children: List.generate(
            5,
            (index) => const Expanded(
                  child: Icon(Icons.ac_unit),
                )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
