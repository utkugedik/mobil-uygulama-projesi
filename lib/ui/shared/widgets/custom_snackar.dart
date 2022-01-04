import 'package:flutter/material.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';

enum SnackBarType { success, error }

class CustomSnackBar {
  static SnackBar show({required String message, required SnackBarType snackBarType, required Duration duration, String? actionLabel, VoidCallback? action}) {
    return SnackBar(
      action: (action != null && actionLabel != null) ? SnackBarAction(label: actionLabel, onPressed: action) : null,
      duration: duration,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 9),
      backgroundColor: AppColors.alabaster,
      content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: Text(
            message,
            style: AppTextStyles.p3SemiBold.copyWith(
              color: snackBarType == SnackBarType.error ? AppColors.redColor : AppColors.lima,
            ),
          ),
        )
      ]),
    );
  }
}
