import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handihub/features/ui/auth/presentation/login_screen.dart';
import 'package:handihub/features/widgets/title_widget.dart';

import '../../../../common/app_colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.14),
            Center(child: TitleWidget()),
            Spacer(flex: 2),
            Text(
              "Choose your position",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Seller",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white10),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Customer",
                style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(color: AppColors.primaryColor),
                  backgroundColor: Colors.white),
            ),
            Spacer(flex: 3)
          ],
        ),
      ),
    );
  }
}
