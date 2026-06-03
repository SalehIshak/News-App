import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/featuers/home/screens/book_mark_screen.dart';
import 'package:news_app/featuers/home/screens/home_screen.dart';
import 'package:news_app/featuers/home/screens/profile_screen.dart';
import 'package:news_app/featuers/home/screens/search_screen.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final PageController pageController = PageController();
  int currentScreen = 0;

  List<Widget> screensList = [
    HomeScreen(),
    SearchScreen(),
    BookMarkScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: pageController, children: screensList),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        onTap: (index) {
          setState(() {
            currentScreen = index;
          });
          pageController.jumpToPage(currentScreen);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            label: "BookMark",
            icon: Icon(CupertinoIcons.bookmark),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
