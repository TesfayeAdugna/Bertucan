import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../shared/themes/app_theme.dart';

class Questionnaire extends StatefulWidget {
  final QuestionnaireModel questionnaire;
  final Function(List<int>) onAnswer;
  const Questionnaire({
    Key? key,
    required this.questionnaire,
    required this.onAnswer,
  }) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  List<int> answersIndexes = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocalizedText(
            widget.questionnaire.question,
            style: AppTheme.titleStyle.copyWith(color: AppTheme.textBlack),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (!widget.questionnaire.isMultiple) {
                        setState(() {
                          answersIndexes.add(index);
                        });
                        widget.onAnswer(answersIndexes);
                      } else {
                        if (answersIndexes.contains(index)) {
                          setState(() {
                            answersIndexes.remove(index);
                          });
                        } else {
                          setState(() {
                            answersIndexes.add(index);
                          });
                        }
                      }
                    },
                    child: Container(
                      decoration: AppTheme.textFieldDecoration().copyWith(
                          color: answersIndexes.contains(index)
                              ? AppTheme.primaryColor
                              : AppTheme.boxGrey),
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: LocalizedText(
                        widget.questionnaire.answers[index],
                        style: AppTheme.buttonLabelStyle.copyWith(
                          color: answersIndexes.contains(index)
                              ? AppTheme.white
                              : AppTheme.textGrey,
                        ),
                      ),
                    ));
              },
              itemCount: widget.questionnaire.answers.length,
            ),
          ),
          if (widget.questionnaire.isMultiple)
            Column(
              children: [
                const SizedBox(height: 10),
                RoundedButton(
                  text: "next",
                  onPressed: () {
                    widget.onAnswer(answersIndexes);
                  },
                ),
                const SizedBox(height: 60),
              ],
            )
        ],
      ),
    );
  }
}
