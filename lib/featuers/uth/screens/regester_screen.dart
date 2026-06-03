import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/featuers/uth/provider/uth_provider.dart';
import 'package:news_app/featuers/uth/screens/log_in_screen.dart';
import 'package:news_app/featuers/uth/widgets/custom_botton.dart';
import 'package:news_app/featuers/uth/widgets/custom_text.dart';
import 'package:news_app/core/widgets/custom_text_form_fieled.dart';
import 'package:provider/provider.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _fomKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final uthProvider = context.watch<UthProvider>();
    return GestureDetector(
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: _fomKey,
                      child: Column(
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

                          //// USER NAME
                          Text(
                            'User Name',
                            style: TextStyle(
                              color: Color(0xff141414),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "TimesNewRoman",
                            ),
                          ),
                          Gap(5),
                          CustomTextFormFieled(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return " Enter Yure Name";
                              }
                              return null;
                            },
                            controller: userNameController,
                            hintText: "Name",
                            isPassowrd: false,
                          ),
                          Gap(10),

                          //// EMAIL
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
                          CustomTextFormFieled(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return " Enter Yure Email";
                              } else if (!value.contains("@")) {
                                return "Youe Email Must Contain @ ";
                              }
                              return null;
                            },
                            controller: emailController,
                            hintText: "Email",
                            isPassowrd: false,
                          ),
                          Gap(10),

                          //// PASSWORD
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
                          CustomTextFormFieled(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter  Password";
                              }
                              if (value.length < 8) {
                                return "password must be  8 leters";
                              }

                              RegExp passRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-*/#$@]).{8,}$');

                              if (!passRegExp.hasMatch(value)) {
                                return " password weak must contain (-*/+ A X)";
                              }
                              return null;
                            },
                            controller: passwordController,
                            hintText: "*********",
                            isPassowrd: true,
                          ),
                          Gap(20),

                          //// CONFIRM PASSWORD
                          Text(
                            'Confirm Passward',
                            style: TextStyle(
                              color: Color(0xff141414),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "TimesNewRoman",
                            ),
                          ),
                          Gap(10),
                          CustomTextFormFieled(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter  Password";
                              }
                              if (value.length < 8) {
                                return "password must be  8 leters";
                              }

                              RegExp passRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-*/#$@]).{8,}$');

                              if (!passRegExp.hasMatch(value)) {
                                return " password weak must contain (-*/+ A X)";
                              }
                              return null;
                            },
                            controller: confirmPasswordController,
                            hintText: "*********",
                            isPassowrd: true,
                          ),
                          Gap(20),

                          if (uthProvider.errorMaessage != null)
                            Text(uthProvider.errorMaessage!, style: TextStyle(color: Colors.red)),
                          Gap(10),

                          /// Sign In Botton
                          CustomBotton(
                            onPressed: () {
                              if (_fomKey.currentState?.validate() ?? false) {
                                uthProvider.regester(emailController.text, passwordController.text, userNameController.text);

                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                              }
                            },
                            text: uthProvider.isSineUpLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Color(0xFFFFFCFC),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "TimesNewRoman",
                                    ),
                                  ),
                          ),
                          Gap(50),

                          /// End Text
                          CustomText(
                            fristText: "Have an account ?",
                            secondText: "Sign In",
                            onPress: () {
                              Navigator.pop(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
