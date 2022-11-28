import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:abushakir/abushakir.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class EthioSelectableDates extends StatelessWidget {
  final List<EtDatetime> selectableDates;
  final EtDatetime selectedDate;
  final Function setSelectedDate;
  HomeController _homeController = Get.find();
  EthioSelectableDates(
      {Key? key,
      required this.selectableDates,
      required this.selectedDate,
      required this.setSelectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> weekDays = {
      "Mon": "ሰ",
      "Tue": "ማ",
      "Wed": "ረ",
      "Thu": "ሐ",
      "Fri": "አ",
      "Sat": "ቅ",
      "Sun": "እ"
    };
    return SizedBox(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: selectableDates.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final date = selectableDates[index];
            DateTime gregorian =
                DateTime.fromMillisecondsSinceEpoch(date.moment);
            return InkWell(
              onTap: () {
                _homeController.setSelectedDateInit(true);
                setSelectedDate(
                    DateTime.fromMillisecondsSinceEpoch(date.moment));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: _homeController.selectedDateInit &&
                          selectedDate.day == date.day
                      ? AppTheme.secondaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "${weekDays[DateFormat.E().format(DateTime(gregorian.year, gregorian.month, gregorian.day))]}",
                        style: AppTheme.greySubtitleStyle),
                    Text("${date.day}",
                        style: AppTheme.titleStyle4.copyWith(
                            color: _homeController.selectedDateInit &&
                                    selectedDate.day == date.day
                                ? AppTheme.white
                                : AppTheme.textBlack))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
