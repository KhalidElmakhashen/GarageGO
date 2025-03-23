import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:legarage/presentation/pages/current_page.dart';
import 'package:legarage/presentation/pages/explore_page.dart';
import 'package:legarage/presentation/pages/notification_page.dart';
import 'package:legarage/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List pages = [
    ExplorePage(),
    CurrentPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // App Body
        body: pages[pageIndex],

        // Navigation Bar
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.inversePrimary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16),
            child: GNav(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              color: Theme.of(context).colorScheme.primary,
              tabBackgroundColor: Theme.of(context).colorScheme.secondary,
              gap: 8,
              onTabChange: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              padding: EdgeInsets.all(5),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Explore',
                ),
                GButton(
                  icon: Icons.gps_fixed,
                  text: 'Current',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notification',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'profile',
                ),
              ],
            ),
          ),
        ));
  }
}
