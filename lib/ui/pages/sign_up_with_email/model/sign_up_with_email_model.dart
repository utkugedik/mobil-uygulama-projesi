import 'package:flutter/material.dart';

class SignUpWithEmailModel {
  String? text;
  TextStyle? style;
  dynamic route;
  SignUpWithEmailModel({
    this.text,
    this.style,
    this.route,
  });

  SignUpWithEmailModel copyWith({
    String? text,
    TextStyle? style,
    dynamic route,
  }) {
    return SignUpWithEmailModel(
      text: text ?? this.text,
      style: style ?? this.style,
      route: route ?? this.route,
    );
  }

  @override
  String toString() => 'SignUpWithEmailModel(text: $text, style: $style, route: $route)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpWithEmailModel && other.text == text && other.style == style && other.route == route;
  }

  @override
  int get hashCode => text.hashCode ^ style.hashCode ^ route.hashCode;
}
