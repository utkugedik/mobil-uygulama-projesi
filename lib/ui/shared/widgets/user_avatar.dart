import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/list_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';

enum AvatarShadowType { noShadow, lowShadow, highShadow }

class UserAvatar extends StatelessWidget {
  final double size;
  final String? image;
  final AvatarShadowType avatarShadowType;
  final String? name;
  final Color nameColor;
  final bool isNetworkImage;

  const UserAvatar({
    Key? key,
    required this.size,
    this.image,
    this.avatarShadowType = AvatarShadowType.noShadow,
    this.name,
    this.nameColor = Colors.white,
    this.isNetworkImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return name == null
        ? _buildAvatar()
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(),
              Text(
                name!,
                style: AppTextStyles.p3SemiBold.copyWith(color: nameColor),
              )
            ].withGap(6),
          );
  }

  Container _buildAvatar() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: _buildAvatarShadow(),
          image: image != null
              ? DecorationImage(
                  image: isNetworkImage
                      ? Image.network(
                          image!,
                          fit: BoxFit.fill,
                        ).image
                      : AssetImage(image!),
                )
              : null),
      child: image == null
          ? SizedBox.expand(
              child: SvgPicture.asset("assets/svg/big_avatar_icon.svg"),
            )
          : const SizedBox(),
    );
  }

  List<BoxShadow> _buildAvatarShadow() {
    switch (avatarShadowType) {
      case AvatarShadowType.noShadow:
        return [];
      case AvatarShadowType.lowShadow:
        return const [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 0),
            blurRadius: 4,
          ),
        ];
      case AvatarShadowType.highShadow:
        return const [
          BoxShadow(
            color: Color(0x3d2a003e),
            offset: Offset(0, 0),
            blurRadius: 32,
          ),
        ];
    }
  }
}
