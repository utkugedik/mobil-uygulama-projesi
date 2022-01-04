import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobil_programlama_odev/ui/pages/splash_page/viewmodel/splash_viewmodel.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/gradients.dart';

class SplashPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
        await context.read(splashVMProvider).navigateUserAfterSplashDone(context);
      });
    }, []);

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(gradient: AppGradients.primaryGradient),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
