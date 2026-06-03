import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  final PageController pageController = PageController();

  int currentIndex = 0;
  bool isLastPage = false;

  void changeIndex(int index) {
    currentIndex = index;

    if (currentIndex == 2) {
      isLastPage = true;
    } else {
      isLastPage = false;
    }

    notifyListeners();
  }

  void getStarted() {
    pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
