import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/presentation/screens/home_screen.dart';
import 'package:movie_mania/presentation/screens/search_screen.dart';
import 'package:movie_mania/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:movie_mania/presentation/utility/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MainBottomNavController>(
        builder: (mainBottomNavController) {
          return Scaffold(
            body: _screens[mainBottomNavController.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.appThemeBlack,
              selectedItemColor: AppColors.appThemeRed,
              unselectedItemColor: AppColors.appThemeWhite,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: mainBottomNavController.selectedIndex,
              onTap: (value) => mainBottomNavController.changeIndex(value),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_rounded,
                  ),
                  label: "Search",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
