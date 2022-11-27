import 'dart:ffi';
import 'dart:io';

import 'package:edipo/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import 'button/custom_elevated_button.dart';

class CustomPageContainer extends StatelessWidget {
  final int flex;
  final int flex2;
  final String title;
  final double padding;
  final Widget content;
  final String? assetImage;
  final String buttonText;
  bool showCarrierAndSenderButton;
  bool isSelect1;
  bool isSelect2;
  bool showProfilePhoto;
  bool showCustomElevationButton;
  CustomPageContainer(
      {required this.flex,
      this.flex2 = 8,
      this.title = "",
      required this.padding,
      required this.content,
      this.assetImage,
      this.showCarrierAndSenderButton = false,
      this.isSelect1 = false,
      this.isSelect2 = false,
      this.showProfilePhoto = false,
      this.showCustomElevationButton = false,
      this.buttonText = "",
      Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: flex,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showCarrierAndSenderButton != true &&
                        showProfilePhoto != true)
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                    if (showProfilePhoto != true && title != "")
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.01,
                            horizontal: context.width * 0.02),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              title,
                              style: context.textTheme.headline5,
                              textAlign: TextAlign.start,
                            )),
                      ),
                    Expanded(flex: flex2, child: content),
                    if (showCustomElevationButton != false)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 90, top: 10),
                        child: CustomElevationButton(
                            primaryColor: context.theme.colorScheme.error,
                            //minimumSize: Size(context.width * 0.9, 45),
                            onPressed: () async {},
                            title: Text(
                              buttonText,
                              style: context.textTheme.button,
                            )),
                      ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
