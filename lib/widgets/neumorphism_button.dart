import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class NeumorphismButton extends StatefulWidget {
  final isDarkMode;
  final String child;

  final VoidCallback onPressed;

  const NeumorphismButton({
    required this.child,
    required this.onPressed,
    this.isDarkMode = false,
    super.key,
  });

  @override
  State<NeumorphismButton> createState() => _NeumorphismButtonState();
}

class _NeumorphismButtonState extends State<NeumorphismButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    var distance = isPressed ? const Offset(10, 10) : const Offset(18, 18);
    var blur = isPressed ? 5.0 : 30.0;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Listener(
        onPointerUp: (_) {
          setState(() {
            isPressed = false;
          });
        },
        onPointerDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: blur,
                offset: -distance,
                color: widget.isDarkMode
                    ? darkShadowTopColor
                    : lightShadowTopColor,
                inset: isPressed,
              ),
              BoxShadow(
                blurRadius: blur,
                offset: distance,
                color: widget.isDarkMode
                    ? darkShadowBottomColor
                    : lightShadowBottomColor,
                inset: isPressed,
              ),
            ],
          ),
          child: SizedBox(
            // height: 200,
            // width: 200,
            child: Center(
              child: Text(
                widget.child,
                style: GoogleFonts.nunitoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode
                        ? lightShadowTopColor
                        : Color(0xFF66727C)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
