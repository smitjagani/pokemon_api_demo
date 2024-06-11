// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget implements PreferredSizeWidget {
  AppTitle({
    super.key,
    required this.title,
    this.isBack = false,
    this.centerTitle,
    this.onTap,
    this.color,
  });

  final String title;
  final bool? isBack;
  final bool? centerTitle;
  final Color? color;
  void Function()? onTap;

  // Build method to create the widget
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Colors.lightBlue,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle ?? false,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      leading: isBack!
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new_sharp),
            )
          : null,
      // Display the localized title text
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.apply(
              fontWeightDelta: 1, // Increase font weight
            ),
      ),
    );
  }

  // Specify the preferred size of the app bar
  @override
  Size get preferredSize => const Size.fromHeight(56); // Set the height of the app bar
}
