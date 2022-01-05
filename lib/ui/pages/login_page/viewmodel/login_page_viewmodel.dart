import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/core/services/registration_services.dart';
import 'package:mobil_programlama_odev/ui/pages/login_page/model/login_data_model.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';

class LoginPageVM extends ChangeNotifier {
  final ProviderReference ref;

  late UserCredential userCredential;

  bool isLoading = false;

  LoginPageVM(this.ref);

  LoginDataModel loginDataModel = LoginDataModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setEmail(String value) {
    loginDataModel.email = value;
  }

  void setPassword(String value) {
    loginDataModel.password = value;
  }

  void setLoading(bool loadingStatus) {
    isLoading = loadingStatus;
    notifyListeners();
  }

  Future<void> login(
    BuildContext context, {
    String? email,
    String? password,
    bool validated = false,
  }) async {
    try {
      if (validated || formKey.currentState!.validate()) {
        userCredential = await context.read(registrationServicesProvider).signInWithMail(email ?? loginDataModel.email, password ?? loginDataModel.password);
        context.navigateTo(const HomeTabMainRoute());
      }
    } on FirebaseAuthException catch (e) {
      context.showSnackBar(message: e.message);
    }
  }
}

final loginPageVMprovider = ChangeNotifierProvider.autoDispose((ref) => LoginPageVM(ref));
