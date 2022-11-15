import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/localized_text.dart';

class SymptomsPage extends StatelessWidget {
  const SymptomsPage({Key? key}) : super(key: key);

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
                      child:
                          LocalizedText("back", style: AppTheme.titleStyle3)),
                ],
              ),
              Text(
                "24 January. Cycle Day 23",
                style: AppTheme.greySubtitleStyle
                    .copyWith(color: AppTheme.textGrey2),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  LocalizedText("how_are_you_feeling_today",
                      style: AppTheme.titleStyle.copyWith(
                          color: AppTheme.textDarkGrey, fontSize: 30)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "People with a cycle like yours tend to experiance these symptoms between their fertile days and periods",
                    style: AppTheme.titleStyle4.copyWith(
                      color: AppTheme.textDarkGrey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: AppTheme.whiteBoxDecoration(),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LocalizedText(
                              "select_your_sumptoms",
                              style: AppTheme.greySubtitleStyle.copyWith(
                                  fontSize: 20, color: AppTheme.textDarkGrey),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildIcond(
                                    'feedback.png',
                                    "Everything\nis fine",
                                    const Color(0xFFC062CF)),
                                buildIcond('pain.png', "Cramps",
                                    const Color(0xFFC062CF)),
                                buildIcond('breast.png', "Tender\nBreasts",
                                    const Color(0xFFC062CF)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildIcond('migraine.png', "Headache",
                                    const Color(0xFFC062CF)),
                                buildIcond('gallery.png', "Acne",
                                    const Color(0xFFC062CF)),
                                buildIcond('breast.png', "Tender\nBreasts",
                                    const Color(0xFFC062CF)),
                              ],
                            )
                          ]),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }

  Column buildIcond(String image, String tag, Color color) {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: color,
          child: Image.asset(
            'assets/$image',
            height: 35.0,
            width: 35,
          ),
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
        ),
        Text(tag)
      ],
    );
  }
}
