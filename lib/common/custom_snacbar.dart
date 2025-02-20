import 'package:flutter/material.dart';

import 'app_colors.dart';

void showSnacbar(context, String title) {
  var mes = ScaffoldMessenger.of(context);
  mes.removeCurrentSnackBar();
  mes.showSnackBar(
    SnackBar(
      elevation: 0,
      duration: Duration(seconds: 1),
      content: Container(
        padding: const EdgeInsets.all(12),
        // margin: const EdgeInsets.all(8.0),,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      backgroundColor: Colors.transparent,
    ),
  );
}
