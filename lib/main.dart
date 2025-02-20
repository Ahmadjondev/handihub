import 'package:flutter/material.dart';
import 'package:handihub/common/app_colors.dart';
import 'package:handihub/features/ui/auth/presentation/auth_screen.dart';

import 'features/ui/splash/presentation/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,

        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryColor,
          colorScheme: ColorScheme.light(
            background: AppColors.primaryColor,
            primary: AppColors.primaryColor,
          )
        )
      ),
      home: SplashScreen(),
    ),
  );
}
