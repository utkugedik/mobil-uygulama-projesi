import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';
import 'package:supercharged/supercharged.dart';

class CustomButton extends HookWidget {
  final String buttonText;
  final bool isDisabled;
  final Function onPressed;
  final bool? isLoading;
  final double? borderRadius, height, width;
  final Color? backgroundColor, borderColor, textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final String? iconPath;
  final EdgeInsets? iconMargin;
  final bool isSvgIcon;
  final double? iconHeight;
  final double? iconWidth;
  final Color? iconColor;

  const CustomButton({
    required this.buttonText,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading,
    this.borderRadius = 24,
    this.width = double.infinity,
    this.height = 48,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.textStyle,
    this.margin,
    this.iconPath,
    this.iconMargin,
    this.isSvgIcon = false,
    this.iconHeight,
    this.iconWidth,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonLoading = useState(false);
    final mounted = useIsMounted();

    void toggleButtonLoading() {
      if (isLoading == null) {
        isButtonLoading.value = !isButtonLoading.value;
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (isDisabled || (isLoading ?? isButtonLoading.value))
          ? null
          : () async {
              FocusManager.instance.primaryFocus?.unfocus();
              toggleButtonLoading();
              await onPressed();
              if (mounted()) {
                toggleButtonLoading();
              }
            },
      child: AnimatedContainer(
        duration: 0.3.seconds,
        width: width,
        margin: margin ?? const EdgeInsets.only(bottom: 12),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: isDisabled ? (backgroundColor != null ? backgroundColor!.withOpacity(0.2) : AppColors.mainColor.withOpacity(0.2)) : (backgroundColor ?? AppColors.mainColor),
        ),
        child: Stack(
          children: [
            Center(
              child: isLoading ?? isButtonLoading.value
                  ? CircularProgressIndicator(color: backgroundColor != null && backgroundColor == AppColors.whiteColor ? AppColors.mainColor : AppColors.whiteColor)
                  : Text(buttonText, style: textStyle ?? AppTextStyles.p1SemiBold.copyWith(color: textColor ?? AppColors.whiteColor)),
            ),
            if (iconPath != null)
              Container(
                margin: iconMargin ?? const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: isSvgIcon
                    ? SvgPicture.asset(
                        iconPath!,
                        color: iconColor,
                        height: iconHeight,
                        width: iconWidth,
                      )
                    : Image.asset(
                        iconPath!,
                        color: iconColor,
                        height: iconHeight,
                        width: iconWidth,
                      ),
              )
          ],
        ),
      ),
    );
  }
}
