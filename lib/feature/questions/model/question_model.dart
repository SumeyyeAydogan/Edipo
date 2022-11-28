class QuestionModel{
  int id;
  String question;
  bool? yesOrNo;
  int placeId;

  QuestionModel({required this.id,required this.question,this.yesOrNo, required this.placeId});

}