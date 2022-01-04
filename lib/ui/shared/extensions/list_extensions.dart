import 'package:flutter/material.dart';

extension GappedListExtension on List<Widget> {
  List<Widget> withGap(double gap, {bool isVertical = true}) {
    return expand((element) sync* {
      var index = indexOf(element);
      if (index != 0) {
        yield SizedBox(
          width: isVertical ? gap : null,
          height: !isVertical ? null : gap,
        );
      }
      yield element;
    }).toList();
  }
}
