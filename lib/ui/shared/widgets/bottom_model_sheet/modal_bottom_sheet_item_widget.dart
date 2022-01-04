import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';

class ModalBottomSheetItemWidget extends StatelessWidget {
  final String title;
  final dynamic route;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool centerTitle;
  final Color? textColor;

  const ModalBottomSheetItemWidget({
    required this.title,
    this.onPressed,
    this.route,
    this.icon,
    this.centerTitle = false,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed ??
              () {
                if (route != null) {
                  context.popRoute();
                  context.navigateTo(route);
                }
              },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        size: 24,
                        color: AppColors.blackColor,
                      )
                    : const SizedBox(),
                SizedBox(
                  width: icon != null ? 9 : 0,
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                    style: AppTextStyles.p2Medium.copyWith(color: textColor ?? AppColors.touchBlack),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: AppColors.gray5, thickness: 0.5, height: 0.5),
      ],
    );
  }
}
