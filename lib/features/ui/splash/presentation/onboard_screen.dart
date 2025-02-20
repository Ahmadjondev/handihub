import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handihub/common/app_colors.dart';
import 'package:handihub/common/assets.dart';
import 'package:handihub/features/widgets/title_widget.dart';

import '../../../../common/models/onboard_model.dart';
import '../../auth/presentation/auth_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List<OnboardModel> onboards = [
    OnboardModel(
        image: Assets.imagesOnboard1, title: "All your favourite crafts"),
    OnboardModel(
        image: Assets.imagesOnboard2, title: "Get your deliveries fast"),
  ];

  @override
  void initState() {
    super.initState();
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: size.height * .01),
              const TitleWidget(),
              SizedBox(height: size.height * .05),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onboards.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = onboards[index];
                    return Column(
                      children: [
                        Image.asset(item.image),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                  if ((pageController.page ?? 0.0).toInt() + 1 ==
                      onboards.length) {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const AuthScreen()));
                  }
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
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
              SizedBox(height: size.height * .1),

            ],
          ),
        ),
      ),
    );
  }
}
