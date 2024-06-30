
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/routes/routes.dart';
import 'package:movies/core/utils/app_images.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 4),
          () {
        Navigator.of(context).pushReplacementNamed(RoutesName.homeApp);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
          child: Container(
            height: 195.h,
            width: 220.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splash),
              ),
            ),
          ),
        ),
      ),
    );
  }
}