import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChancesOfPregnancy extends StatelessWidget {
  const ChancesOfPregnancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cream,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                const Center(
                    child: LocalizedText("back", style: AppTheme.titleStyle3)),
              ],
            ),
            Text(
              "24 January. Cycle Day 23",
              style: AppTheme.greySubtitleStyle
                  .copyWith(color: AppTheme.textGrey2),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  LocalizedText("todays_chance_of_pregnancy",
                      textAlign: TextAlign.center,
                      style: AppTheme.titleStyle.copyWith(
                          color: AppTheme.textDarkGrey, fontSize: 30)),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: AppTheme.whiteBoxDecoration(),
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(37),
                            color: AppTheme.subtlePurple,
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                LocalizedText(
                                  "likely_to_be",
                                  style: AppTheme.titleStyle2,
                                ),
                                LocalizedText(
                                  "low",
                                  style: AppTheme.titleStyle5,
                                ),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 30),
                        child: Text(
                          "The chance of getting pregnant increases during ovulatio and the fertile days occur can change from cycle to cycle. Fertile days prediction shouldn’t be used for contraception.",
                          style: AppTheme.titleStyle4.copyWith(
                            color: AppTheme.textDarkGrey,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: LocalizedText(
                      "This prediction is based on the last period you logged",
                      style: AppTheme.titleStyle4
                          .copyWith(color: AppTheme.textGrey),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
