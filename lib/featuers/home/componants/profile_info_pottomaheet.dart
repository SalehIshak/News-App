import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/datasource/local_data/prefrances_manager.dart';
import 'package:news_app/core/widgets/custom_text_form_fieled.dart';
import 'package:news_app/featuers/home/providers/profile_provider.dart';
import 'package:news_app/featuers/uth/widgets/custom_botton.dart';

class ProfileInfoPottomaheet extends StatefulWidget {
  final ProfileProvider provider;
  const ProfileInfoPottomaheet({super.key, required this.provider});

  @override
  State<ProfileInfoPottomaheet> createState() => _ProfileInfoPottomaheetState();
}

class _ProfileInfoPottomaheetState extends State<ProfileInfoPottomaheet> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    showUserDataAtPersonalInfoSecton();
  }

  void showUserDataAtPersonalInfoSecton() {
    userNameController.text = PrefrancesManager().getString("user_name")!;
    emailController.text = PrefrancesManager().getString("user_email")!;
    passwordController.text = PrefrancesManager().getString("user_password")!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.49,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100)),
                    width: 32,
                    height: 4,
                  ),
                ),
                Gap(20),
                Text("Profile Info"),
                Gap(15),
                Text("User Name"),
                CustomTextFormFieled(
                  hintText: "User Name",
                  isPassowrd: false,
                  controller: userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plase Enter User Name ";
                    }
                    return null;
                  },
                ),

                Gap(15),
                Text("Email"),
                CustomTextFormFieled(
                  hintText: "Email",
                  isPassowrd: false,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plase Enter Email";
                    }
                    return null;
                  },
                ),

                Gap(15),
                Text("Password"),
                CustomTextFormFieled(
                  hintText: "Password",
                  isPassowrd: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plase Enter Password";
                    }
                    return null;
                  },
                ),

                Gap(20),
                CustomBotton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      widget.provider.editUserNameInfo(userNameController.text, emailController.text, passwordController.text);
                      Navigator.pop(context);
                    }
                  },
                  text: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
