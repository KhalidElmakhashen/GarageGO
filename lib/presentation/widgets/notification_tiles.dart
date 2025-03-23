import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationTiles extends StatelessWidget {
  String title;
  int leading;
  Color color;

  NotificationTiles({
    required this.title,
    required this.leading,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        leading: Text(
          leading.toString(),
          style: TextStyle(
            color: color == Theme.of(context).colorScheme.inversePrimary
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: color == Theme.of(context).colorScheme.inversePrimary
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          "كل عام وانتم ف الشهر الكريم فائزون برحمه الله وبركاته ",
          style: TextStyle(
            color: color == Theme.of(context).colorScheme.inversePrimary
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}
