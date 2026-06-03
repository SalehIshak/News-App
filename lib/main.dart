import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/local_data/prefrances_manager.dart';
import 'package:news_app/core/theme/light_theme.dart' show LightTheme;
import 'package:news_app/featuers/onboarding/controller/onboarding_controller.dart';
import 'package:news_app/featuers/splash/splash_screen.dart';
import 'package:news_app/featuers/uth/provider/uth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefrancesManager().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardingProvider()),
        ChangeNotifierProvider(create: (context) => UthProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: LightTheme.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
