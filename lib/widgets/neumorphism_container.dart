import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:neumorphism_calculator/constants/colors.dart';

class NeumorphismContainer extends StatelessWidget {
  final bool isDarkMode;
  const NeumorphismContainer({required this.isDarkMode, super.key});

  @override
  Widget build(BuildContext context) {
    var distance = const Offset(5, 5);
    var blur = 5.0;
    final backgroundColor =
        isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: blur,
            offset: -distance,
            color: isDarkMode ? darkShadowTopColor : lightShadowTopColor,
            inset: true,
          ),
          BoxShadow(
            blurRadius: blur,
            offset: distance,
            color: isDarkMode ? darkShadowBottomColor : lightShadowBottomColor,
            inset: true,
          ),
        ],
      ),
    );
  }
}
