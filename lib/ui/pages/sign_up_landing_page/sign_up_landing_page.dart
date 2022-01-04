import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/pages/sign_up_landing_page/constants/sign_up_landing_constants.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_appbar.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_button.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/page_title_widget.dart';

class SignUpLandingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    _loginText() {
      return TextSpan(
        recognizer: TapGestureRecognizer()..onTap = () => context.navigateTo(const LogInRoute()),
        text: " Giriş yap",
        style: AppTextStyles.p2ExtraBold.copyWith(color: AppColors.mainColor),
      );
    }

    return Scaffold(
      appBar: CustomAppbar(
        title: SignUpLandingConstants.appBarName,
        leadingOnPress: () => context.router.pop(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: PageTitleWidget(
              firstText: SignUpLandingConstants.signUpTitleText,
              secondText: SignUpLandingConstants.signUpTitleAccountText,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: CustomButton(
              width: 340,
              buttonText: SignUpLandingConstants.signUpButtonText,
              onPressed: () => context.navigateTo(const SignUpWithEmailRoute()),
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: RichText(
              text: TextSpan(
                text: SignUpLandingConstants.alreadyHaveAnAccount,
                style: AppTextStyles.p2,
                children: [_loginText()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
