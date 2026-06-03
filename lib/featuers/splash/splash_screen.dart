import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/local_data/prefrances_manager.dart';
import 'package:news_app/featuers/home/rout_screen.dart';
import 'package:news_app/featuers/onboarding/screens/onboarding_screen.dart';
import 'package:news_app/featuers/uth/screens/log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// we should to give it some time
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      redirectUser();
    });
  }

  /// get Datar From Local Storage
  void redirectUser() async {
    final isOnBoardingSeen = PrefrancesManager().getBool("has_seen_onboarding") ?? false;
    final isLogedIn = PrefrancesManager().getString("user_email");

    if (!mounted) return;

    if (isOnBoardingSeen && isLogedIn != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RouteScreen()));
    } else if (isOnBoardingSeen && isLogedIn == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInScreen()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset("assets/images/splash/splash.png"));
  }
}
