import 'package:edipo/core/extension/context_extension.dart';
import 'package:edipo/feature/home/view/home_view.dart';
import 'package:edipo/feature/location/view/location_view.dart';
import 'package:edipo/product/widgets/bottom_sheet.dart';
import 'package:edipo/product/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../questions.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  bool _isCheck = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: questionLists.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[100],
              margin: EdgeInsets.all(10),
              child: SizedBox(
                height: context.height * 0.11,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(questionLists[index].question,
                              style: TextStyle(fontSize: 17))),
                      Expanded(
                        flex: 5,
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Radio( 
                              value: true,
                              groupValue: questionLists[index].yesOrNo,
                              onChanged: ((value) {
                                setState(() {
                                  questionLists[index].yesOrNo = value;
                                for (var item in questionLists) {
                                   _isCheck=  item.yesOrNo??false;
                                }
                                });
                              })),
                          Text("Evet"),
                          Radio(
                              value: false,
                              groupValue: questionLists[index].yesOrNo,
                              onChanged: ((value) {
                                setState(() {
                                  questionLists[index].yesOrNo = value;
                            for (var item in questionLists) {
                                    _isCheck=  item.yesOrNo??false ;
                                }
                                });
                              })),
                          Text("Hayır"),
                        ]),
                      ),
                    ],
                  ),
                )),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            );
          },
        ),
        _myButton(
          isVisible: _isCheck,
          onPress: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ],
    );
  }
}

class _myButton extends StatefulWidget {
  _myButton({required this.onPress, Key? key, this.isVisible})
      : super(key: key);
  Function() onPress;
  bool? isVisible;
  @override
  State<_myButton> createState() => _myButtonState();
}

class _myButtonState extends State<_myButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
         style: ElevatedButton.styleFrom( 
          backgroundColor: widget.isVisible ?? true
              ? context.colors.secondary
              : context.colors.primary),
      onPressed: widget.isVisible ?? true ? widget.onPress : null,
      child: Text("Değerlendir"),

    );
  }
}
