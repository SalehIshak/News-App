import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/local_data/prefrances_manager.dart';
import 'package:news_app/core/mixins/safe_notiy_mixin.dart';

class UthProvider extends ChangeNotifier with SafeNotify {
  String? userName;

  ///// GET IMAGE FROM SHARED PREFRANCE

  String? errorMaessage;
  ///////   Login Method ///////////////
  bool isLoading = false;
  Future<void> logedIn(String email, String password) async {
    errorMaessage = null;
    isLoading = true;
    notify();
    await Future.delayed(Duration(seconds: 1));

    final seavedEmail = PrefrancesManager().getString("user_email");
    final seavedPassword = PrefrancesManager().getString("user_password");

    if (seavedEmail == null && seavedPassword == null) {
      errorMaessage = " No Email Found, please Register";
    } else if (seavedEmail != null && seavedEmail != email.trim()) {
      errorMaessage = "please enter a valid email";
    } else if (seavedPassword != null && seavedPassword != password.trim()) {
      errorMaessage = "please enter a valid password";
    }
    isLoading = false;
    notify();
  }

  ////// Regester Method ////////////////
  bool isSineUpLoading = false;
  void regester(String email, String password, String userName) async {
    errorMaessage = null;
    isSineUpLoading = true;
    notify();
    await Future.delayed(Duration(seconds: 2));

    final savedEmail = PrefrancesManager().getString("user_email");
    if (savedEmail != null && savedEmail == email.trim()) {
      errorMaessage = "User Already Regesterd";
    } else {
      await PrefrancesManager().setString("user_email", email);
      await PrefrancesManager().setString("user_name", userName);
      await PrefrancesManager().setString("user_password", password);
      await PrefrancesManager().setBool("has_seen_onboarding", true);
      isSineUpLoading = false;
      notify();
    }
  }
}
