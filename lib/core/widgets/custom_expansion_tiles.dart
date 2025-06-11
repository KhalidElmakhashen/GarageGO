import 'package:flutter/material.dart';

class CustomExpantionTiles extends StatelessWidget {
  final String title;
  final Widget child;
  const CustomExpantionTiles(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title,
          style: TextStyle(
            color: Color(0xFF1F3171),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
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
      children: [
        Divider(
          color: Colors.black .withOpacity(0.3),
          thickness: 1,
          height: 1,
        ),
        child
        ],
    );
  }
}
