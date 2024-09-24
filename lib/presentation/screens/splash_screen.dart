import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/presentation/screens/home_screen.dart';
import 'package:movie_mania/presentation/screens/main_bottom_nav_screen.dart';
import 'package:movie_mania/presentation/utility/app_colors.dart';
import 'package:movie_mania/presentation/utility/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async => _moveToNextScreen(),
    );
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const MainBottomNavScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appThemeBlack,
        body: Image.asset(
          AssetsPath.splashScreenLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
