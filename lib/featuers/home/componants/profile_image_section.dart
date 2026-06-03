import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/featuers/home/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, widget) {
        return Center(
          child: Column(
            children: [
              /// STACK (PROFILEiMAGE & CAMIRA ICON)
              Stack(
                children: [
                  /// IMAGE
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFA0A0A0)),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFF5F7FA),
                      backgroundImage: provider.profileImage != null ? FileImage(provider.profileImage!) : null,
                      radius: 60,
                      child: provider.profileImage == null ? Image.asset("assets/images/home/logo.png", fit: BoxFit.fill) : null,
                    ),
                  ),

                  //// CAMIRA ICON
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                              title: Center(child: Text("chose your image", style: TextStyle(fontSize: 15))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      provider.pickImageFromCamira();
                                    },
                                    child: Row(children: [Icon(Icons.camera_alt_outlined), Gap(10), Text("from camira")]),
                                  ),
                                  Gap(15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      provider.pickImageFromGalary();
                                    },
                                    child: Row(children: [Icon(Icons.image_outlined), Gap(10), Text("from galary")]),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFFA0A0A0)),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFF5F7FA),
                          radius: 15,
                          child: Icon(Icons.camera_alt_outlined, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Gap(5),

              //// USER
              Text(provider.userName!),
            ],
          ),
        );
      },
    );
  }
}
