import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DailyDetailPage extends StatelessWidget {
  const DailyDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
                Text(DateFormat.MMMMd().format(DateTime.now()),
                    style: AppTheme.titleStyle4.copyWith(color: Colors.black)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      LocalizedText('weight',
                          style: AppTheme.buttonLabelStyle
                              .copyWith(color: Colors.black)),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: const Color(0xFFE4F7F9),
                        ),
                        child: (Image.asset(
                          'assets/badge.png',
                          width: 30,
                          height: 20,
                          fit: BoxFit.scaleDown,
                        )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      LocalizedText('sleep',
                          style: AppTheme.buttonLabelStyle
                              .copyWith(color: Colors.black)),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xFFE4F7F9),
                        ),
                        child: (Image.asset(
                          'assets/badge.png',
                          width: 30,
                          height: 30,
                        )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      LocalizedText('water',
                          style: AppTheme.buttonLabelStyle
                              .copyWith(color: Colors.black)),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xFFE4F7F9),
                        ),
                        child: (Image.asset(
                          'assets/badge.png',
                          width: 30,
                          height: 30,
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: const Color(0xFFEAEAEA),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LocalizedText('sex_and_sex_drive',
                      style: AppTheme.buttonLabelStyle
                          .copyWith(color: Colors.black)),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      buildIcond('heart.png', "didn't_have_sex",
                          const Color(0xFFED6392)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond('shield.png', "protected_ex",
                          const Color(0xFFED6392)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond('like.png', "unprotected_sex",
                          const Color(0xFFED6392)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond('like_2.png', "high_sex_drive",
                          const Color(0xFFED6392)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond('heart_2.png', "masturbation",
                          const Color(0xFFED6392))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: const Color(0xFFEAEAEA),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LocalizedText('mood',
                      style: AppTheme.buttonLabelStyle
                          .copyWith(color: Colors.black)),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      buildIcond('calm.png', "calm", const Color(0xFFFC9A2F)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond('happy.png', "happy", const Color(0xFFFC9A2F)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond(
                          'power.png', "energetic", const Color(0xFFFC9A2F)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond(
                          'friskiness.png', "frisky", const Color(0xFFFC9A2F)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond(
                          'sad.png', "mood_swings", const Color(0xFFFC9A2F))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: const Color(0xFFEAEAEA),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LocalizedText('symptoms',
                      style: AppTheme.buttonLabelStyle
                          .copyWith(color: Colors.black)),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      buildIcond('feedback.png', "Everything\nis fine",
                          const Color(0xFFC062CF)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond('pain.png', "Cramps", const Color(0xFFC062CF)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond('breast.png', "Tender\nBreasts",
                          const Color(0xFFC062CF)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond(
                          'migraine.png', "Headache", const Color(0xFFC062CF)),
                      const SizedBox(
                        width: 15,
                      ),
                      buildIcond('gallery.png', "Acne", const Color(0xFFC062CF))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
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
        SizedBox(
          height: 10,
        ),
        LocalizedText(tag, textAlign: TextAlign.center)
      ],
    );
  }
}
