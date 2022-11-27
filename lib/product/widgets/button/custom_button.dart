import 'package:edipo/core/extension/context_extension.dart';
import 'package:edipo/core/init/theme/edipo_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onPressed;
  final String title;
  final bool isSelect;
  final double? width;
  CustomButton({Key? key, required this.onPressed, required this.title, this.isSelect = false, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: context.height * 0.05,
          width: width,
          decoration: BoxDecoration(
            color: isSelect
                ? EdipoTheme.defaultTheme.colorScheme.secondary
                : EdipoTheme.defaultTheme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            title,
            style: isSelect ? context.textTheme.button : context.textTheme.headline6,
          )),
        ));
  }
}
