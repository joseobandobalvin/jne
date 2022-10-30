import 'package:jne/configs/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color textColor, backgroundColor, borderColor;
  final bool fullWidth;
  final EdgeInsets padding;
  final double? fontSize;
  const RoundedButton({
    super.key,
    this.onPressed,
    required this.label,
    this.textColor = Colors.white,
    this.backgroundColor = primaryColorLight,
    this.borderColor = primaryColorLight,
    this.fullWidth = true,
    this.padding = const EdgeInsets.symmetric(vertical: 9, horizontal: 30),
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 30,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: fullWidth ? double.infinity : null,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1.4,
            color: borderColor,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
