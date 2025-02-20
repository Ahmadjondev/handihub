import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handihub/common/assets.dart';
import 'package:handihub/common/custom_snacbar.dart';
import 'package:handihub/features/ui/auth/presentation/register_screen.dart';
import 'package:handihub/features/widgets/title_widget.dart';

import '../../../../common/app_colors.dart';
import '../../home/presentation/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  ValueNotifier<bool> showPassword = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: TitleWidget()),
            SizedBox(height: size.height * .1),
            Text(
              "Login to your account",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10.0),
            emailTextField(),
            SizedBox(height: 10.0),
            passwordTextField(),
            SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: Text("Forgot password?"),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text.trim().isEmpty) {
                  showSnacbar(context, "Enter your email");
                  return;
                }
                if (_passwordController.text.trim().isEmpty) {
                  showSnacbar(context, "Enter your password");
                  return;
                }
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (route) => false);
              },
              child: Text(
                "Sign in",
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
            SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade300,
                    endIndent: 10,
                  ),
                ),
                Text(
                  "Or sign in with",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade300,
                    indent: 10,
                  ),
                ),
              ],
            ),
            SizedBox(height: 23),
            anotherSignIn(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget emailTextField() {
    return TextField(
      controller: _usernameController,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget passwordTextField() {
    return ValueListenableBuilder(
      valueListenable: showPassword,
      builder: (context, value, child) {
        return TextField(
          controller: _passwordController,
          obscureText: value,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                !value
                    ? CupertinoIcons.eye_slash_fill
                    : CupertinoIcons.eye_fill,
                color: Colors.grey,
              ),
              onPressed: () {
                showPassword.value = !showPassword.value;
              },
            ),
          ),
        );
      },
    );
  }

  Widget anotherSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Assets.iconsGoogle,
              height: 34,
              width: 34,
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryColor.withOpacity(.4)),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Assets.iconsFacebook,
              height: 34,
              width: 34,
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryColor.withOpacity(.4)),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Assets.iconsTwitter,
              height: 34,
              width: 34,
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryColor.withOpacity(.4)),
        ),
      ],
    );
  }
}
