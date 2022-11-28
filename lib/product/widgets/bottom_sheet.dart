import 'package:edipo/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

Future<dynamic> customBottomSheet(BuildContext context, Widget page) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
              height: context.height * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      InkWell( onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                             padding: context.paddingLow,
                              child: Icon(Icons.arrow_back_ios_rounded,
                                  color:
                                      Theme.of(context).dividerTheme.color),
                            ),
                          ),
                      Divider(
                        color: Theme.of(context).dividerTheme.color,

                        thickness: 3,
                        indent: MediaQuery.of(context).size.width * 0.45,
                        endIndent: MediaQuery.of(context).size.width * 0.45,

                      ),
                      Positioned(
                          right: 10,
                           top: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                            child: Padding(
                              padding: context.paddingLow,
                              child: Icon(Icons.close_rounded,
                                  color:
                                      Theme.of(context).dividerTheme.color),
                            ),
                          )),
                    ],
                  ),
                  Expanded(child: page),
                ],
              )),
        );
      });
}
