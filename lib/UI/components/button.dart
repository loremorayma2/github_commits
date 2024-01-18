import 'package:flutter/material.dart';
import 'package:github_commits/styles/text.dart';

class Button extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color bgColor;
  final Color hoverColor;
  final Color disableColor;
  final double paddingX;
  final double paddingY;
  final VoidCallback onPressed;

  const Button.heading5Style({
    Key? key, 
    required this.text,
    required this.bgColor,
    required this.hoverColor,
    required this.disableColor,
    required this.paddingX,
    required this.paddingY,
    required this.onPressed,
  })  : style = heading5Style,
        super(key: key); 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
        textStyle: style,
        onSurface: disableColor,
        shape: RoundedRectangleBorder( // Definir la forma del botón
          borderRadius: BorderRadius.circular(10.0), // Aplicar el radio del borde
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}