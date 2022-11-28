

import 'package:flutter/material.dart';

class CustomElevationButton extends StatefulWidget {
  final VoidCallback?  onPressed;
  final Widget? title;
  final bool isCircle;
  final Color? primaryColor;
  final Size? minimumSize;
  const CustomElevationButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.isCircle = false,
      this.primaryColor,
      this.minimumSize})
      : super(key: key);

  @override
  State<CustomElevationButton> createState() => _CustomElevationButtonState();
}

class _CustomElevationButtonState extends State<CustomElevationButton> {
 
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: widget.minimumSize,
          backgroundColor: widget.primaryColor,
          shape: widget.isCircle ? const CircleBorder() : null),
      child: widget.title,
    );
  }
}