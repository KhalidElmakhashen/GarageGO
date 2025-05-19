import 'package:flutter/material.dart';

class CustomExpantionTiles extends StatelessWidget {
  final String title;
  final Widget child;
  const CustomExpantionTiles(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.blueAccent),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.blueAccent),
      ),
      children: [child],
    );
  }
}
