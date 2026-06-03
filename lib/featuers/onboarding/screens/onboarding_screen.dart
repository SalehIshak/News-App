// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/datasource/local_data/prefrances_manager.dart';
import 'package:news_app/featuers/onboarding/controller/onboarding_controller.dart';
import 'package:news_app/featuers/onboarding/models/onboarding_model.dart';
import 'package:news_app/featuers/uth/screens/log_in_screen.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

      /// AppBar
      appBar: AppBar(
        actions: [
          Consumer<OnboardingProvider>(
            builder:
                (
                  BuildContext context,
                  OnboardingProvider value,
                  Widget? chiled,
                ) {
                  return value.currentIndex == 2
                      ? SizedBox.shrink()
                      : TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInScreen(),
                              ),
                            );

                            /// set data using PrefrancesManager
                            PrefrancesManager().setBool(
                              "has_seen_onboarding",
                              true,
                            );
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          ),
                        );
                },
          ),
        ],
      ),

      /// Body
      body: SafeArea(
        child: Column(
          children: [
            /// Image & Texts
            Expanded(
              child: Consumer(
                builder:
                    (
                      BuildContext context,
                      OnboardingProvider value,
                      Widget? widget,
                    ) {
                      return PageView.builder(
                        controller: value.pageController,
                        itemCount: OnboardingModel.onBoardingList.length,
                        onPageChanged: (index) {
                          value.changeIndex(index);
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 20,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// image
                                SizedBox(
                                  height: 375,
                                  child: Image.asset(
                                    OnboardingModel.onBoardingList[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Gap(30),

                                /// title
                                Text(
                                  OnboardingModel.onBoardingList[index].title,
                                ),
                                Gap(15),

                                ///
                                Text(
                                  OnboardingModel
                                      .onBoardingList[index]
                                      .description,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
              ),
            ),

            //// Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Consumer<OnboardingProvider>(
                  builder:
                      (
                        BuildContext context,
                        OnboardingProvider value,
                        Widget? widget,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            curve: Curves.easeInOut,
                            width: value.currentIndex == index ? 30 : 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: value.currentIndex == index
                                  ? Color(0xfffc53030)
                                  : Color(0xfffd3d3d3),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        );
                      },
                );
              }),
            ),
            Gap(100),

            /// Elevated Botton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<OnboardingProvider>(
                builder: (context, OnboardingProvider value, Widget? wedget) {
                  return ElevatedButton(
                    onPressed: () {
                      value.isLastPage
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInScreen(),
                              ),
                            )
                          : value.getStarted();

                      /// set data using PrefrancesManager
                      PrefrancesManager().setBool("has_seen_onboarding", true);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: Text(value.isLastPage ? "Get Started" : "Next"),
                  );
                },
              ),
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
