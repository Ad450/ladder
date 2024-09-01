import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LadderTextButton extends StatelessWidget {
  const LadderTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isBusy = false,
    this.style,
    this.buttonStyle,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isBusy;
  final TextStyle? style;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return isBusy
        ? const CupertinoActivityIndicator()
        : ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: Text(
              text,
              style: style,
            ),
          );
  }
}
