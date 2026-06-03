import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/featuers/home/componants/profile_image_section.dart';
import 'package:news_app/featuers/home/componants/profile_info_pottomaheet.dart';
import 'package:news_app/featuers/home/providers/profile_provider.dart';
import 'package:news_app/featuers/uth/screens/log_in_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (context) => ProfileProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text("Profile"), centerTitle: true),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///// IMAGE & USER NAME SECTION
                Gap(15),
                ProfileImageSection(),

                ///// PROFILE INFO SECTION
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(20),
                      Text("Edit Profile Info", style: TextStyle(fontFamily: "TimesNewRoman")),
                      ///// لابد من همل كونسيومر هنا بهذه الطريقة لان شيت مودل ليه شجرة جديدة فلن نتمكن من الوصول الي الكونتكست الخاص ب الاتشانجنوتيفاير
                      Consumer<ProfileProvider>(
                        builder: (context, provider, _) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (_) {
                                  return ProfileInfoPottomaheet(provider: provider);
                                },
                              );
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 0),
                              leading: Icon(Icons.person_2_outlined, size: 25),
                              title: Text("Personal Info", style: TextStyle(fontFamily: "TimesNewRoman")),
                              trailing: Icon(Icons.arrow_forward_ios, size: 20),
                            ),
                          );
                        },
                      ),
                      Divider(),

                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        leading: Icon(Icons.language, size: 25),
                        title: Text("Language", style: TextStyle(fontFamily: "TimesNewRoman")),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      Divider(),

                      Consumer<ProfileProvider>(
                        builder: (context, provider, _) {
                          return GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (country) {
                                  provider.saveCountry(country);
                                },
                              );
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 0),
                              leading: Icon(Icons.flag_outlined, size: 25),
                              title: Text(provider.sellectedCountry ?? "Country", style: TextStyle(fontFamily: "TimesNewRoman")),
                              trailing: Icon(Icons.arrow_forward_ios, size: 20),
                            ),
                          );
                        },
                      ),

                      Divider(),

                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        leading: Icon(Icons.article, size: 25),
                        title: Text("Terms & Conditions", style: TextStyle(fontFamily: "TimesNewRoman")),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.clear();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          leading: Icon(Icons.logout_outlined, size: 25, color: Colors.red),
                          title: Text(
                            "Logout",
                            style: TextStyle(fontFamily: "TimesNewRoman", color: Colors.red),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.red, size: 20),
                        ),
                      ),
                    ],
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
