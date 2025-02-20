import 'dart:async';

import 'package:flutter/material.dart';
import 'package:handihub/common/app_colors.dart';
import 'package:handihub/features/ui/splash/presentation/onboard_screen.dart';
import 'package:handihub/features/widgets/title_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: TitleWidget(titleColor: Colors.white,),
      ),
    );
  }
}
