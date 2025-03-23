import 'package:flutter/material.dart';
import 'package:legarage/presentation/routes.dart';
import 'package:legarage/utils/theme/light_mode.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lighMode,
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

