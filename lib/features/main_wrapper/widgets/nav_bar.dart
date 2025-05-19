import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';




// ignore: must_be_immutable
class MyNavBar extends StatelessWidget {
  PageController pageController;
  int index;
  MyNavBar({super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/images/seramic.jpg'),
              fit: BoxFit.cover,
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16),
        child: GNav(
          backgroundColor: Colors.transparent,
          // activeColor: Theme.of(context).colorScheme.inversePrimary,
          activeColor: Colors.white,
          // color: Theme.of(context).colorScheme.primary,
          color: Colors.blue,
          // tabBackgroundColor: Theme.of(context).colorScheme.secondary,
          tabBackgroundColor: Colors.blue,
          gap: 8,
          selectedIndex: index,
          onTabChange: (int index) {
            pageController.jumpToPage(index);
          },
          haptic: false,
          padding: const EdgeInsets.all(5),
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
    );
  }
}
