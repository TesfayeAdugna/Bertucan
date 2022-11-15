import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final pageViewController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: pageViewController,
          children: <Widget>[
            Container(
              height: 20,
              padding: const EdgeInsets.only(left: 40, right: 40, top: 180),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/first.png',
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.2),
                      alignment: Alignment.center,
                      child: LocalizedText(
                        "take_control_of_your_cycle",
                        style: AppTheme.titleStyle2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: LocalizedText(
                        "plan_vacations_and_schedules_around_predicted_cycle",
                        style: AppTheme.normal2TextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 180),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/second.jpg',
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                        alignment: Alignment.center,
                        child: LocalizedText(
                          "increase_your_sexual_and_reproductive_health knowledge",
                          style: AppTheme.titleStyle2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        child: LocalizedText(
                          "plan_vacations_and_schedules_around_predicted_cycle",
                          style: AppTheme.normal2TextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 180),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/third.png',
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      alignment: Alignment.center,
                      child: LocalizedText(
                        "be_aware_about_gender_based violations_and_report_them_easily",
                        style: AppTheme.titleStyle2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: LocalizedText(
                        "plan_vacations_and_schedules_around_predicted_cycle",
                        style: AppTheme.normal2TextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: LocalizedText('skip',
                      style: AppTheme.normal2TextStyle
                          .copyWith(color: AppTheme.primaryColor)),
                  onPressed: () {
                    Get.toNamed(Routes.signupPage);
                  },
                ),
                IconButton(
                    onPressed: _onPageChanged,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: AppTheme.primaryColor,
                    ))
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void _onPageChanged() {
    if (_currentPage == 0) {
      setState(() {
        _currentPage = 1;
      });
      pageViewController.jumpToPage(1);
    } else if (_currentPage == 1) {
      setState(() {
        _currentPage = 2;
      });
      pageViewController.jumpToPage(2);
    } else
      Get.toNamed(Routes.signupPage);
  }
}
