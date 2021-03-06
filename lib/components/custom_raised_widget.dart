import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius,
    this.onPressed,
  });
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: RaisedButton(
      onPressed: onPressed,
      child: child,
      color: color,
      disabledColor: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      )),
    ));
  }
}
