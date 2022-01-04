import 'package:flutter/material.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';

class PageTitleWidget extends StatelessWidget {
  final String? firstText, secondText, thirdOptionalText;
  final bool isPinkStyleReversed;

  const PageTitleWidget({
    this.firstText,
    this.secondText,
    this.thirdOptionalText,
    this.isPinkStyleReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText ?? "",
        style: isPinkStyleReversed ? AppTextStyles.h2ExtraBold.copyWith(color: AppColors.mainColor) : AppTextStyles.h2ExtraBold,
        children: [
          TextSpan(
            text: """ $secondText""",
            style: !isPinkStyleReversed ? AppTextStyles.h2ExtraBold.copyWith(color: AppColors.mainColor) : AppTextStyles.h2ExtraBold,
          ),
          TextSpan(
            text: thirdOptionalText ?? "",
            style: AppTextStyles.h2ExtraBold,
          )
        ],
      ),
    );
  }
}
