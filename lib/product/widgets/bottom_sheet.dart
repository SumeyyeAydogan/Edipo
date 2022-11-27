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
                  //  _BaseSheetHeader(),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 3,
                        indent: MediaQuery.of(context).size.width * 0.45,
                        endIndent: MediaQuery.of(context).size.width * 0.45,
                      ),
                      Positioned(
                          right: 10,
                          top: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.close),
                            ),
                          ))
                    ],
                  ),
                  Expanded(child: page),
                ],
              )),
        );
      });
}
