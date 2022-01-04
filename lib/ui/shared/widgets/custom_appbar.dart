import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';

class CustomAppbar extends HookWidget with PreferredSizeWidget {
  final String? title;
  final TextStyle? titleStyle;
  final VoidCallback? leadingOnPress, trailingOnPressed, titleOnPressed;
  final IconData? leadingIcon;
  final Color? leadingIconColor, trailingIconcolor;
  final bool? isLoading;
  final bool? centerTitle;
  final bool showLeading;
  final String? svgPath;
  final double? svgHeight;
  final double? svgWidth;
  final Color? svgColor;
  final Widget? trailingIcon;

  const CustomAppbar({
    this.title,
    this.titleStyle,
    this.titleOnPressed,
    this.leadingOnPress,
    this.leadingIcon,
    this.leadingIconColor,
    this.trailingOnPressed,
    this.trailingIcon,
    this.isLoading = false,
    this.centerTitle,
    this.trailingIconcolor,
    this.showLeading = true,
    this.svgPath,
    this.svgHeight,
    this.svgWidth,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    return useMemoized(
      () => AppBar(
        elevation: 0,
        textTheme: Theme.of(context).textTheme,
        backgroundColor: AppColors.whiteColor,
        centerTitle: centerTitle ?? true,
        title: TextButton(
          onPressed: titleOnPressed,
          child: Text(
            title ?? '',
            style: titleStyle ?? AppTextStyles.p2ExtraBold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: showLeading
            ? IconButton(
                onPressed: leadingOnPress ?? () => context.popRoute(),
                icon: Icon(leadingIcon ?? Icons.arrow_back_ios_rounded),
                color: leadingIconColor ?? AppColors.touchBlack,
              )
            : Container(),
        actions: [
          trailingIcon != null
              ? IconButton(
                  onPressed: (isLoading!) ? null : trailingOnPressed,
                  icon: isLoading!
                      ? Center(
                          child: CircularProgressIndicator(
                            color: trailingIconcolor ?? AppColors.touchBlack,
                          ),
                        )
                      : trailingIcon!,
                  color: trailingIconcolor ?? AppColors.touchBlack,
                )
              : svgPath != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 21),
                      child: SvgPicture.asset(
                        svgPath ?? '',
                        color: svgColor,
                        height: svgHeight,
                        width: svgWidth,
                      ),
                    )
                  : Container(),
        ],
      ),
      [isLoading, title],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
