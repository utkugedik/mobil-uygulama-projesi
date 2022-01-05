import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobil_programlama_odev/ui/pages/sign_up_with_email/constants/sign_up_with_email_constants.dart';
import 'package:mobil_programlama_odev/ui/pages/sign_up_with_email/viewmodel/sign_up_viewmodel.dart';
import 'package:mobil_programlama_odev/ui/shared/enums/textfield_type.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/string_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_model_sheet/modal_bottom_sheet_item.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_sheet_menu.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_appbar.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_button.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_textfield.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/focus_escape.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/user_avatar.dart';

class SignUpWithEmailPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final emailAddressFocusNode = useFocusNode();
    final usernameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final confirmPasswordFocusNode = useFocusNode();
    final signUpProvider = useProvider(signUpVMprovider);
    final isPasswordVisible = useState(true);
    final isConfirmPasswordVisible = useState(true);
    String? fileName;

    return FocusEscape(
      child: Scaffold(
        appBar: CustomAppbar(
          title: SignUpWithEmailConstants.appBartitle,
          leadingOnPress: () => context.router.pop(),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: signUpProvider.formKeyWithEmail,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: SingleChildScrollView(
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
                                    onPressedFunction: () async {
                                      final result = await FilePicker.platform.pickFiles(
                                        allowMultiple: false,
                                        type: FileType.custom,
                                        allowedExtensions: ['png', 'jpg'],
                                      );
                                      if (result == null) {
                                        context.showSnackBar(message: 'Dosya secilmedi');
                                      }
                                      final path = result?.files.single.path;
                                      fileName = result?.files.single.name ?? '';
                                      File file = File(path!);
                                      context.read(signUpVMprovider).setFileName(fileName!);
                                      context.read(signUpVMprovider).setImageUrl(file);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(42, 0, 62, 0.2),
                                blurRadius: 42,
                              )
                            ]),
                            padding: const EdgeInsets.symmetric(horizontal: 21),
                            child: const UserAvatar(size: 105),
                          ),
                        ),
                        Text(
                          fileName ?? '',
                          style: AppTextStyles.p3ExtraBold.copyWith(
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Fotoğraf yüklemek zorunludur",
                          style: AppTextStyles.p3ExtraBold.copyWith(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 56),
                  CustomTextField(
                    hintText: SignUpWithEmailConstants.emailPlaceholder,
                    textFieldType: TextFieldType.mail,
                    value: signUpProvider.signUpDataModel.email,
                    focusNode: emailAddressFocusNode,
                    nextFocusNode: usernameFocusNode,
                    validate: (v) => v!.isValidMail,
                    placeHolderTextStyle: AppTextStyles.p2Medium.copyWith(color: AppColors.gray3),
                    onChange: (value) => context.read(signUpVMprovider).setEmail(value),
                  ),
                  CustomTextField(
                    hintText: SignUpWithEmailConstants.usernamePlaceholder,
                    value: signUpProvider.signUpDataModel.username,
                    focusNode: usernameFocusNode,
                    nextFocusNode: passwordFocusNode,
                    placeHolderTextStyle: AppTextStyles.p2Medium.copyWith(color: AppColors.gray3),
                    validate: (v) => v!.hasData,
                    onChange: (value) => context.read(signUpVMprovider).setUsername(value),
                  ),
                  CustomTextField(
                    hintText: SignUpWithEmailConstants.passwordPlaceholder,
                    focusNode: passwordFocusNode,
                    nextFocusNode: confirmPasswordFocusNode,
                    obscureText: isPasswordVisible.value,
                    value: signUpProvider.signUpDataModel.password,
                    suffixIcon: IconButton(
                      icon: isPasswordVisible.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      onPressed: () => isPasswordVisible.value = !isPasswordVisible.value,
                      color: AppColors.gray3,
                    ),
                    validate: (v) => v!.isValidPassword,
                    onChange: (value) => context.read(signUpVMprovider).setPassword(value),
                  ),
                  CustomTextField(
                    hintText: SignUpWithEmailConstants.confirmPasswordPlaceholder,
                    focusNode: confirmPasswordFocusNode,
                    obscureText: isConfirmPasswordVisible.value,
                    value: signUpProvider.confirmPassword,
                    suffixIcon: IconButton(
                      icon: isConfirmPasswordVisible.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      onPressed: () => isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value,
                      color: AppColors.gray3,
                    ),
                    validate: (v) => v!.isConfirmPasswordMatch(signUpProvider.signUpDataModel.password),
                    onChange: (value) => context.read(signUpVMprovider).setConfirmPassword(value),
                  ),
                  const SizedBox(height: 47),
                  CustomButton(
                    buttonText: SignUpWithEmailConstants.buttonText,
                    onPressed: () => context.read(signUpVMprovider).signUp(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
