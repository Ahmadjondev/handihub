import 'package:flutter/material.dart';
import 'package:handihub/common/app_colors.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, this.titleColor});

  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Usta',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: titleColor ?? Colors.black87,
        ),
        children: [
          TextSpan(
              text: '.',
              style: TextStyle(color: titleColor ?? AppColors.primaryColor)),
        ],
      ),
    );
  }
}
