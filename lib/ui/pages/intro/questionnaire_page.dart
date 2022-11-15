import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/questionnaire.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/pages/intro/log_period_info.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionnairePage extends StatefulWidget {
  QuestionnairePage({Key? key}) : super(key: key);

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final AuthController _authController = Get.find();
  List<Questionnaire> questionnaireWidgets = [];

  @override
  void initState() {
    super.initState();
    setQuestionnairiesWidget();
  }

  @override
  Widget build(BuildContext context) {
    return LogPeriodInfoPage();
    // return Scaffold(
    //     body: Column(
    //   children: [
    //     const SizedBox(height: 35),
    //     Row(
    //       children: [
    //         LinearPercentIndicator(
    //           width: MediaQuery.of(context).size.width * 0.82,
    //           lineHeight: 3.0,
    //           percent: questionnaireWidgets.isNotEmpty
    //               ? (_currentIndex <= questionnaireWidgets.length)
    //                   ? _currentIndex / questionnaireWidgets.length
    //                   : 1
    //               : 0,
    //           backgroundColor: AppTheme.hintGrey,
    //           progressColor: AppTheme.textBlack,
    //           barRadius: const Radius.circular(5),
    //         ),
    //         TextButton(
    //             onPressed: () {
    //               _currentIndex <= questionnaireWidgets.length
    //                   ? _changeQuestion(_currentIndex + 1)
    //                   : Get.toNamed(Routes.homePage);
    //             },
    //             child: LocalizedText(
    //               "skip",
    //               style: AppTheme.greySubtitleStyle
    //                   .copyWith(color: AppTheme.textBlack),
    //             ))
    //       ],
    //     ),
    //     SizedBox(
    //       height: MediaQuery.of(context).size.height * 0.05,
    //     ),
    //     Expanded(
    //       child: PageView(
    //           controller: _pageController, children: questionnaireWidgets),
    //     ),
    //   ],
    // ));
  }

  void setQuestionnairiesWidget() {
    List<Questionnaire> questionnairies = [];
    _authController.getQuestionnairies();
    for (var element in _authController.questionnairies) {
      questionnairies.add(Questionnaire(
          questionnaire: element,
          onAnswer: (answers) {
            _authController.setAnswer(element, answers);
            _changeQuestion(element.id);
          }));
    }
    setState(() {
      questionnaireWidgets = questionnairies;
    });
  }

  void _changeQuestion(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }
}
