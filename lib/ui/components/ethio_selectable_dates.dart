import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:abushakir/abushakir.dart';
import 'package:intl/intl.dart';


class EthioSelectableDates extends StatelessWidget {
  final List<EtDatetime> selectableDates;
  final EtDatetime selectedDate;
  final Function setSelectedDate;
  const EthioSelectableDates(
      {Key? key,
      required this.selectableDates,
      required this.selectedDate,
      required this.setSelectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> weekDays = {
      "Mon":"ሰ",
      "Tue":"ማ",
      "Wed":"ረ",
      "Thu":"ሐ",
      "Fri":"አ",
      "Sat":"ቅ",
      "Sun":"እ"
    };
    return SizedBox(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: selectableDates.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final date = selectableDates[index];
            final DateTime gregorian = DateTime.fromMillisecondsSinceEpoch(date.moment);
            return InkWell(
              onTap: () {
                EtDatetime.fromMillisecondsSinceEpoch(setSelectedDate(DateTime.fromMillisecondsSinceEpoch(date.moment)));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: selectedDate == date
                      ? AppTheme.secondaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    Text("${weekDays[DateFormat.E().format(
                          DateTime(gregorian.year, gregorian.month, gregorian.day))]}",
                        style: AppTheme.greySubtitleStyle),
                    Text(
                      "${date.day}",
                        style: AppTheme.titleStyle4.copyWith(
                            color: selectedDate == date
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
