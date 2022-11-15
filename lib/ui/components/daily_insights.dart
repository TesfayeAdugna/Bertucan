import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/ui/widgets/daily_insight_card.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyInsights extends StatelessWidget {
  DailyInsights({Key? key}) : super(key: key);
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LocalizedText("my_daily_insights", style: AppTheme.boldTitle),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // DailyInsightCard(
              //   title: "log_your_symptoms",
              //   bottom: const Icon(
              //     Icons.add_circle,
              //     color: AppTheme.subtleGreen,
              //     size: 30,
              //   ),
              //   onPressed: () {
              //     Get.toNamed(Routes.dailyDetailPage);
              //   },
              // ),
              // DailyInsightCard(
              //   title: "todays_cycle_day",
              //   bottom: Text(
              //     "${homeController.getUserLogData().daysToStart}",
              //     style: AppTheme.titleStyle2,
              //   ),
              //   color: AppTheme.subtleGreen,
              // ),
              homeController.currentMenstruation.pregnancyDate != null
                  ? DailyInsightCard(
                      title: "chance_of_getting_pregnant",
                      bottom: LocalizedText(
                        getChanceOfPregnancy(
                            DateTime.now(), homeController.currentMenstruation),
                        style: AppTheme.titleStyle2,
                      ),
                      color: AppTheme.subtleBlue,
                      onPressed: () {
                        Get.toNamed(Routes.logChancePregnancyPage);
                      },
                    )
                  : SizedBox(),
              // DailyInsightCard(
              //   title: "todays_symptoms",
              //   bottom: const Text(
              //     "0",
              //     style: AppTheme.titleStyle2,
              //   ),
              //   color: AppTheme.subtlePink,
              //   onPressed: () {
              //     Get.toNamed(Routes.symptomsPage);
              //   },
              // ),
            ],
          ),
        )
      ],
    );
  }
}
