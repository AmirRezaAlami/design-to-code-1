import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import 'package:task_management_app_ui/view_models/navigation_view_model.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationViewmodel(),
      child: Consumer<NavigationViewmodel>(
          builder: (context, navigationVM, child) {
        return BottomNavigationBar(
          currentIndex: navigationVM.selectedIndex,
          elevation: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Palette.navColor,
          backgroundColor: Palette.gradientDark,
          type: BottomNavigationBarType.fixed,
          onTap: navigationVM.onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/SVGs/home-page.svg",
                width: 25,
                height: 25,
                color: navigationVM.getIconColor(0),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/SVGs/doc-text.svg",
                width: 25,
                height: 25,
                color: navigationVM.getIconColor(1),
              ),
              label: "Stats",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/SVGs/profile.svg",
                width: 25,
                height: 25,
                color: navigationVM.getIconColor(2),
              ),
              label: "Account",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/SVGs/notifications.svg",
                width: 25,
                height: 25,
                color: navigationVM.getIconColor(3),
              ),
              label: "Notification",
            ),
          ],
        );
      }),
    );
  }
}
