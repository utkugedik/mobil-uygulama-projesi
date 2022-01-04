import 'package:flutter/material.dart';

class ModalBottomSheetModel {
  final String title;
  final IconData? icon;
  final dynamic route;
  final VoidCallback? onPressedFunction;
  final Color? textColor;

  const ModalBottomSheetModel({
    required this.title,
    this.icon,
    this.route,
    this.onPressedFunction,
    this.textColor,
  });
}
