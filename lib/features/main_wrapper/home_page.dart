import 'package:flutter/material.dart';
import 'package:legarage/features/current_page/current_page.dart';
import 'package:legarage/features/explore_page/explore_page.dart';
import 'package:legarage/features/main_wrapper/widgets/nav_bar.dart';
import 'package:legarage/features/notification/ui/notification_page.dart';
import 'package:legarage/features/profile/ui/profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Body
      body: PageView(
        onPageChanged: (int index) => setState(() {
          currentPage = index;
        }),
        controller: pageController,
        children: const [
          ExplorePage(),
          CurrentPage(),
          NotificationPage(),
          ProfilePage(),
        ],
      ),

      // Navigation Bar
      bottomNavigationBar: MyNavBar(
        pageController: pageController,
        index: currentPage,
      ),
    );
  }
}
