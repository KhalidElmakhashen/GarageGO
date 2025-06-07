


import 'package:flutter/material.dart';

class IsReservedFalse extends StatelessWidget {
  const IsReservedFalse({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child:  Center(
        child: Text(
          'there is no reserved spot\n please reserve one first',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}