import 'package:edipo/core/extension/context_extension.dart';
import 'package:edipo/feature/home/view/home_view.dart';
import 'package:edipo/feature/location/view/location_view.dart';
import 'package:edipo/feature/questions/model/question_model.dart';
import 'package:edipo/product/constants/text_constants.dart';
import 'package:edipo/product/widgets/bottom_sheet.dart';
import 'package:edipo/product/widgets/button/custom_button.dart';
import 'package:edipo/product/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../questions.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: questionLists.length,
          itemBuilder: (context, index) {
            return Card(
              margin: context.paddingLow,
              child: SizedBox(
                height: context.normalValue,
                child: Padding(
                  padding: context.paddingLow,
                  child: Center(
                      child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(questionLists[index].question,
                              style: TextStyle(fontSize: 17))),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisSize: MainAxisSize.min, 
                        children: [
                          Radio(
                              value: true,
                              groupValue: questionLists[index].yesOrNo,
                              onChanged: ((value) {
                                setState(() {
                                  questionLists[index].yesOrNo = value;
                                });
                              })),
                          Text(TextConstants().yes),
                          Radio( 
                              value: false,
                              groupValue: questionLists[index].yesOrNo,
                              onChanged: ((value) {
                                setState(() {
                                  questionLists[index].yesOrNo = value;
                                });
                              })),
                          Text(TextConstants().no),
                        ]),
                      ),
                    ],
                  )),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            );
          },
        ),
        /*   _myButton(
          isVisible: _isCheck,
          onPress: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),*/

        CustomElevationButton(
            onPressed: () {
              _isCheckAll(questionLists)
                  ? Navigator.of(context).popUntil((route) => route.isFirst)
                  : closeAlertDialog(context);
            },
            title: Text(TextConstants().send),
            primaryColor: context.colors.secondary),
      ],
    );
  }

  
}


Future<dynamic> closeAlertDialog(BuildContext context) {
    return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(TextConstants().questionsError),
                        actions: [
                          Center(
                            child: CustomElevationButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              title: Text(TextConstants().close),
                            ),
                          ),
                        ],
                      );
                    });
  }


bool _isCheckAll(List<QuestionModel> models) {
  bool _isCheck = true;
  for (var model in models) {
    if (model.yesOrNo == null) {
      _isCheck = false;
    }
  }
  return _isCheck;
}
