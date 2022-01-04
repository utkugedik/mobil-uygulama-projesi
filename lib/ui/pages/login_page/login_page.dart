import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/pages/login_page/constants/login_page_constants.dart';
import 'package:mobil_programlama_odev/ui/pages/login_page/viewmodel/login_page_viewmodel.dart';
import 'package:mobil_programlama_odev/ui/shared/enums/textfield_type.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/string_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_appbar.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_button.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_textfield.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/focus_escape.dart';
import 'package:auto_route/auto_route.dart';

class LogInPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final isPasswordVisible = useState(true);
    final loginPageVM = useProvider(loginPageVMprovider);

    return Scaffold(
      body: FocusEscape(
        child: Scaffold(
          appBar: const CustomAppbar(
            title: LogInPageConstants.appbarTitle,
            showLeading: false,
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Form(
                    key: loginPageVM.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 42),
                          CustomTextField(
                            hintText: LogInPageConstants.emailText,
                            textFieldType: TextFieldType.mail,
                            focusNode: emailFocusNode,
                            nextFocusNode: passwordFocusNode,
                            validate: (v) => v!.isValidMail,
                            onChange: (value) => context.read(loginPageVMprovider).setEmail(value),
                          ),
                          CustomTextField(
                            hintText: LogInPageConstants.passwordText,
                            focusNode: passwordFocusNode,
                            obscureText: isPasswordVisible.value,
                            suffixIcon: IconButton(
                              icon: isPasswordVisible.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                              onPressed: () => isPasswordVisible.value = !isPasswordVisible.value,
                              color: AppColors.gray3,
                            ),
                            validate: (v) => v!.isValidPassword,
                            onChange: (value) => context.read(loginPageVMprovider).setPassword(value),
                          ),
                          const SizedBox(height: 36),
                          CustomButton(
                            buttonText: LogInPageConstants.buttonText,
                            onPressed: () => context.read(loginPageVMprovider).login(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: AppColors.gray6,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: LogInPageConstants.dontHaveAnAccount,
                      style: AppTextStyles.p2,
                      children: [
                        TextSpan(
                          text: " " + LogInPageConstants.signUp,
                          recognizer: TapGestureRecognizer()..onTap = () => context.navigateTo(const SignUpLandingRoute()),
                          style: AppTextStyles.p2Bold.copyWith(color: AppColors.mainColor),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
