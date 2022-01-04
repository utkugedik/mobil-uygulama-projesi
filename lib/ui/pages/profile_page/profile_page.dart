import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_model_sheet/modal_bottom_sheet_item.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_sheet_menu.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_appbar.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_button.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/user_avatar.dart';
import 'package:auto_route/auto_route.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? file;
  String? fileName;
  late String url;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).get().then((value) {
      url = value['kullanici_fotosu'];
    });
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: context.dynamicHeight(0.05)),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.showBottomSheet(
                          child: BottomSheetMenu(
                            menuItems: [
                              ModalBottomSheetModel(
                                title: 'Galeri',
                                onPressedFunction: () async {},
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(42, 0, 62, 0.2),
                              blurRadius: 42,
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: url != null ? Image.network(url) : UserAvatar(size: 120),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              CustomButton(
                buttonText: 'Parolami sifirla',
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: FirebaseAuth.instance.currentUser?.email ?? '');
                  } on FirebaseAuthException catch (e) {
                    context.showSnackBar(message: e.message);
                  }
                },
              ),
              const SizedBox(height: 100),
              CustomButton(
                buttonText: 'Hesabimi sil',
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.currentUser?.delete();
                    // context.replaceRoute(const IntroductionRoute());
                  } on FirebaseAuthException catch (e) {
                    context.showSnackBar(message: e.message);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
