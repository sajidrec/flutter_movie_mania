import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/controller_binder.dart';
import 'package:movie_mania/presentation/screens/splash_screen.dart';

class MovieMania extends StatelessWidget {
  const MovieMania({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      home: const SplashScreen(),
    );
  }
}
