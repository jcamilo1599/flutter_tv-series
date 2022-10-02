import 'package:flutter/material.dart';

class MoleculesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool centerTitle;
  final List<Widget>? actions;

  const MoleculesAppBar({
    required this.title,
    this.centerTitle = false,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
