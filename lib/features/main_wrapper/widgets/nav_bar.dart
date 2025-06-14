import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:legarage/core/models/notification_model.dart';

// ignore: must_be_immutable
class MyNavBar extends StatelessWidget {
  PageController pageController;
  int index;
  MyNavBar({super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // decoration: const BoxDecoration(
      //       // borderRadius: BorderRadius.circular(20),
      //       image: DecorationImage(
      //         image: AssetImage('assets/images/seramic.jpg'),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16),
        child: ValueListenableBuilder(
          valueListenable:
              Hive.box<NotificationModel>('notifications').listenable(),
          builder: (context, box, _) {
            int notificationCount = box.values.length;
            return GNav(
              backgroundColor: Colors.white,
              // activeColor: Theme.of(context).colorScheme.inversePrimary,
              activeColor: Colors.white,
              // color: Theme.of(context).colorScheme.primary,
              color: const Color(0xFF1F3171),
              // tabBackgroundColor: Theme.of(context).colorScheme.secondary,
              tabBackgroundColor: const Color(0xFF1F3171),
              gap: 8,
              selectedIndex: index,
              onTabChange: (int index) {
                pageController.jumpToPage(index);
              },
              haptic: true,
              padding: const EdgeInsets.all(5),
              tabs: [
                const GButton(
                  icon: Icons.home,
                  text: 'Explore',
                ),
                const GButton(
                  icon: Icons.gps_fixed,
                  text: 'Current',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notification',
                  leading: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.notifications, size: 24,
                        color: index == 2 ? Colors.white : const Color(0xFF1F3171),
                      ),
                      if (notificationCount > 0)
                        Positioned(
                          right: -6,
                          top: -6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Text(
                              '$notificationCount',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const GButton(
                  icon: Icons.person,
                  text: 'profile',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
