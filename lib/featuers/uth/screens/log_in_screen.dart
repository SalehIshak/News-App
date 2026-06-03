import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/featuers/home/screens/home_screen.dart';
import 'package:news_app/featuers/uth/provider/uth_provider.dart';
import 'package:news_app/featuers/uth/screens/regester_screen.dart';
import 'package:news_app/featuers/uth/widgets/custom_botton.dart';
import 'package:news_app/featuers/uth/widgets/custom_text.dart';
import 'package:news_app/core/widgets/custom_text_form_fieled.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UthProvider>(
      create: (context) => UthProvider(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                /// background Image
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/uth/background_page.png"), fit: BoxFit.cover),
                  ),
                ),

                /// Column
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Consumer<UthProvider>(
                          builder: (context, provider, _) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //// News Word
                                Center(child: Image.asset("assets/images/uth/news_word.png", width: 243, height: 74)),
                                Gap(30),

                                /// Welcome to Newts Text
                                Text(
                                  'Welcome to Newts ',
                                  style: TextStyle(
                                    color: Color(0xff363636),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "TimesNewRoman",
                                  ),
                                ),
                                Gap(10),

                                //// Email Text
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    color: Color(0xff141414),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "TimesNewRoman",
                                  ),
                                ),
                                Gap(5),

                                /// Email Fieled
                                CustomTextFormFieled(
                                  hintText: "Email",
                                  isPassowrd: false,
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return " Enter Email";
                                    }
                                    RegExp emialRegExep = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                                    if (!emialRegExep.hasMatch(value)) {
                                      return "the Email must contain (-*/+@)";
                                    }
                                    return null;
                                  },
                                ),
                                Gap(10),

                                //// Password Text
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    color: Color(0xff141414),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "TimesNewRoman",
                                  ),
                                ),
                                Gap(10),

                                //// Password Password
                                CustomTextFormFieled(
                                  hintText: "Password ***",
                                  isPassowrd: true,
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter  Password";
                                    }
                                    return null;
                                  },
                                ),
                                Gap(15),

                                ////  Check Email and Password Error
                                if (provider.errorMaessage != null)
                                  Text(provider.errorMaessage!, style: TextStyle(color: Colors.red)),
                                Gap(15),

                                /// Sign In Botton
                                CustomBotton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await provider.logedIn(emailController.text, passwordController.text);
                                      if (provider.errorMaessage == null) {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (contetx) => HomeScreen()));
                                      }
                                    }
                                  },
                                  text: provider.isLoading
                                      ? CircularProgressIndicator()
                                      : Text(
                                          " Sign In",
                                          style: TextStyle(
                                            color: Color(0xFFFFFCFC),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "TimesNewRoman",
                                          ),
                                        ),
                                ),
                                Gap(50),

                                /// End Teat
                                CustomText(
                                  fristText: "Don’t have an account ?",
                                  secondText: "Sign Up",
                                  onPress: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegesterScreen()));
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
