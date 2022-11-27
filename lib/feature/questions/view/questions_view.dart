import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
  var questions;
  return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return Card(
          color: Color.fromARGB(255, 78, 177, 81),
          margin: EdgeInsets.all(10),
          child: SizedBox(
            height: 100,
            width: 300,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child:
                        Text(questions[index], style: TextStyle(fontSize: 17)),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(children: [
                      Radio(
                          value: "value",
                          groupValue: "groupValue",
                          onChanged: ((value) {})),
                      Text("Evet"),
                      Radio(
                          value: "value",
                          groupValue: "groupValue",
                          onChanged: ((value) {})),
                      Text("Hayır"),
                    ]),
                  ),
                ],
              ),
            )),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
      },
    );
  }
}