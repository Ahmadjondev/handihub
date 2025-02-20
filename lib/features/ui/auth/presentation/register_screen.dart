import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handihub/common/assets.dart';
import 'package:handihub/common/custom_snacbar.dart';
import 'package:handihub/features/ui/home/presentation/home_screen.dart';
import 'package:handihub/features/widgets/title_widget.dart';

import '../../../../common/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();
  ValueNotifier<bool> showPassword = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(child: TitleWidget()),
            SizedBox(height: size.height * .05),
            const Text(
              "Create your Account",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _usernameController,
              obscureText: false,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            emailTextField(),
            const SizedBox(height: 10.0),
            passwordTextField(),
            const SizedBox(height: 10.0),
            password2TextField(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text.trim().isEmpty) {
                  showSnacbar(context, "Enter your username");
                  return;
                }
                if (_emailController.text.trim().isEmpty) {
                  showSnacbar(context, "Enter your email");
                  return;
                }
                if (_passwordController.text.trim().isEmpty) {
                  showSnacbar(context, "Enter your password");
                  return;
                }
                if (_password2Controller.text.trim().isEmpty) {
                  showSnacbar(context, "Enter your password again");
                  return;
                }
                if (_passwordController.text.trim() !=
                    _password2Controller.text.trim()) {
                  showSnacbar(context, "Passwords do not match");
                  return;
                }
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (route) => false);
              },
              child: const Text(
                "Sign Up",
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
            const SizedBox(height: 30.0),
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
            const SizedBox(height: 23),
            anotherSignIn(),
          ],
        ),
      ),
    );
  }

  ValueListenableBuilder<bool> password2TextField() {
    return ValueListenableBuilder(
      valueListenable: showPassword,
      builder: (context, value, child) {
        return TextField(
          controller: _password2Controller,
          obscureText: value,
          decoration: InputDecoration(
            labelText: 'Confirm password',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        );
      },
    );
  }

  Widget emailTextField() {
    return TextField(
      controller: _emailController,
      obscureText: false,
      decoration: const InputDecoration(
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
            border: const OutlineInputBorder(
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
        const SizedBox(width: 10),
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
        const SizedBox(width: 10),
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
