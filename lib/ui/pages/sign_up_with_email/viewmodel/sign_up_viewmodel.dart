import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/pages/sign_up_with_email/model/sign_up_data_model.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';
import 'package:auto_route/auto_route.dart';

class SignUpVM extends ChangeNotifier {
  final Reader read;
  late UserCredential userCredential;

  SignUpVM(this.read);

  SignUpDataModel signUpDataModel = SignUpDataModel();
  GlobalKey<FormState> formKeyWithEmail = GlobalKey<FormState>();
  String confirmPassword = "";
  File? imageUrl;
  String? fileName;
  bool isLoading = false;
  late String url;

  void setEmail(String value) {
    signUpDataModel.email = value;
  }

  void setUsername(String value) {
    signUpDataModel.username = value;
  }

  void setPassword(String value) {
    signUpDataModel.password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void setImageUrl(File value) {
    imageUrl = value;
  }

  void setFileName(String value) {
    fileName = value;
  }

  void setLoading(bool loadingStatus) {
    isLoading = loadingStatus;
    notifyListeners();
  }

  void signUp(
    BuildContext context, {
    String? email,
    String? password,
  }) async {
    setLoading(true);
    try {
      if (formKeyWithEmail.currentState!.validate()) {
        await FirebaseStorage.instance.ref('profile_picture/$fileName').putFile(imageUrl!);
        await FirebaseStorage.instance.ref('profile_picture/$fileName').getDownloadURL().then((value) => url = value);
        AuthCredential credential = EmailAuthProvider.credential(email: email ?? signUpDataModel.email, password: password ?? signUpDataModel.password);
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email ?? signUpDataModel.email, password: password ?? signUpDataModel.password);
        await FirebaseFirestore.instance.collection('user').doc(userCredential.user?.uid).set({
          'kullanici_adi': signUpDataModel.username,
          'kullanici_fotosu': url,
        });

        FirebaseFirestore.instance.collection('user').doc(userCredential.user?.uid);
        context.replaceRoute(const HomeTabMainRoute());
      }
    } on FirebaseAuthException catch (e) {
      context.showSnackBar(message: e.message);
    } finally {
      setLoading(false);
    }
  }
}

final signUpVMprovider = ChangeNotifierProvider.autoDispose((ref) => SignUpVM(ref.read));
