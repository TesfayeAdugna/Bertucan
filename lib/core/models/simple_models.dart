import 'package:bertucanfrontend/core/models/freezed_models.dart';

class QuestionnaireModel {
  int id;
  String question;
  List<String> answers;
  bool isMultiple;
  List<int>? answerIndexs;

  QuestionnaireModel({
    required this.id,
    required this.question,
    required this.answers,
    this.isMultiple = false,
    this.answerIndexs,
  });

  QuestionnaireModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers = List<String>.from(json['answers']),
        isMultiple = json['isMultiple'],
        answerIndexs = json['answerIndexs'] == null
            ? null
            : List<int>.from(json['answerIndexs']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'answers': answers,
        'isMultiple': isMultiple,
        'answerIndexs': answerIndexs,
      };
}

class NormalResponse {
  bool success;
  dynamic message;
  NormalResponse({required this.success, this.message});
}

class MonthlyMensturationModel {
  DateTime startDate;
  DateTime endDate;
  DateTime? pregnancyDate;
  DateTime? phaseChange;

  MonthlyMensturationModel({
    required this.startDate,
    required this.endDate,
    this.pregnancyDate,
    this.phaseChange,
  });

  MonthlyMensturationModel.fromJson(Map<String, dynamic> json)
      : startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        pregnancyDate = json['pregnancyDate'] == null
            ? null
            : DateTime.parse(json['pregnancyDate']),
        phaseChange = json['phaseChange'] == null
            ? null
            : DateTime.parse(json['phaseChange']);

  Map<String, dynamic> toJson() => {
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'pregnancyDate': pregnancyDate?.toIso8601String(),
        'phaseChange': phaseChange?.toIso8601String(),
      };
}

class UserLogData {
  DateTime startDate;
  DateTime endDate;
  int daysToStart;
  int daysToEnd;

  UserLogData({
    required this.startDate,
    required this.endDate,
    required this.daysToStart,
    required this.daysToEnd,
  });
  UserLogData.fromJson(Map<String, dynamic> json)
      : startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        daysToStart = json['daysToStart'],
        daysToEnd = json['daysToEnd'];

  Map<String, dynamic> toJson() => {
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'daysToStart': daysToStart,
        'daysToEnd': daysToEnd,
      };
}

enum Phase {
  letual,
  menstrual,
}
