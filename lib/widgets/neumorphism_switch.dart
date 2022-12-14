import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class NeumorphismSwitch extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onPressed;
  const NeumorphismSwitch(
      {required this.onPressed, required this.isDarkMode, super.key});

  @override
  State<NeumorphismSwitch> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NeumorphismSwitch> {
  var pressed = true;
  @override
  Widget build(BuildContext context) {
    var distance = pressed ? const Offset(5, 5) : const Offset(18, 18);
    var blur = pressed ? 5.0 : 30.0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          height: 20,
          width: 70,
          decoration: createBoxDecoration(blur, distance),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: widget.isDarkMode
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: createBoxDecoration(blur, distance),
              child: Icon(
                !widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Colors.yellow[900],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration createBoxDecoration(
    double blur,
    Offset distance,
  ) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
          blurRadius: blur,
          offset: -distance,
          color: widget.isDarkMode ? darkShadowTopColor : lightShadowTopColor,
          inset: pressed,
        ),
        BoxShadow(
          blurRadius: blur,
          offset: distance,
          color: widget.isDarkMode
              ? darkShadowBottomColor
              : lightShadowBottomColor,
          inset: pressed,
        )
      ],
    );
  }
}
