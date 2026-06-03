import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/core/datasource/local_data/prefrances_manager.dart';
import 'package:news_app/core/mixins/safe_notiy_mixin.dart';

class ProfileProvider extends ChangeNotifier with SafeNotify {
  ProfileProvider() {
    loadUseData();
  }
  File? profileImage;
  String? userName;
  String? sellectedCountry;

  ///// GET USER DATA //////
  void loadUseData() {
    //// GET USER NAME FROM SHARED PREFRANCES
    userName = PrefrancesManager().getString("user_name");

    ///// GET SELLECTED COUNTRY FROM SHARED PREFRANCES
    sellectedCountry = PrefrancesManager().getString("country_name");

    //// GET IMAGE FROM SHARED PREFRANCES
    final imagePathAtSaredPrefrance = PrefrancesManager().getString("profile_image");
    imagePathAtSaredPrefrance != null ? profileImage = File(imagePathAtSaredPrefrance) : null;
  }

  ////// SET USER NAME INFO AFTER EDIT  ////////////////
  Future<void> editUserNameInfo(String userName, String email, String password) async {
    this.userName = userName;
    await PrefrancesManager().setString("user_name", userName);
    await PrefrancesManager().setString("user_email", email);
    await PrefrancesManager().setString("user_password", password);
    await PrefrancesManager().setBool("has_seen_onboarding", true);
    notify();
  }

  /// SET PROFILE IMAGE FROM GALARY //////
  void pickImageFromGalary() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      await PrefrancesManager().setString("profile_image", pickedImage.path);
    }
    notify();
  }

  ///// SET PROFILE IMAGE FROM CAMIRA ////////
  Future<void> pickImageFromCamira() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      await PrefrancesManager().setString("profile_image", pickedImage.path);
    }
    notify();
  }

  ///// SET COUNTRY DATA ////////
  void saveCountry(Country sellectedCountry) async {
    await PrefrancesManager().setString("country_name", sellectedCountry.name);
    this.sellectedCountry = sellectedCountry.name;
    notify();
  }
}
