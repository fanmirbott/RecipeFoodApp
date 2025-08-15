import 'package:flutter/material.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class PreferencesPageAnimatedContainer extends StatelessWidget {
  final int pageIndex;

  const PreferencesPageAnimatedContainer({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    Alignment alignment;

    switch (pageIndex) {
      case 0:
        alignment = Alignment.topLeft;
        break;
      case 1:
        alignment = Alignment.topCenter;
        break;
      case 2:
        alignment = Alignment.topRight;
        break;
      default:
        alignment = Alignment.topLeft;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: alignment,
      width: 230,
      height: 12,
      decoration: BoxDecoration(
        color: Appcolors().white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        width: 80,
        height: 12,
        decoration: BoxDecoration(
          color: Appcolors().redpinkmain,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
