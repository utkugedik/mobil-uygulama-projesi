import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:auto_route/auto_route.dart';

class SplashVM extends ChangeNotifier {
  late Reader read;
  final ProviderReference ref;

  SplashVM(this.ref) {
    read = ref.read;
  }

  Future<void> navigateUserAfterSplashDone(BuildContext context) async {
    context.replaceRoute(const IntroductionRoute());
  }
}

final splashVMProvider = ChangeNotifierProvider.autoDispose((ref) => SplashVM(ref));
