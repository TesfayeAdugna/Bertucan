import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectableDates extends StatelessWidget {
  final List<DateTime> selectableDates;
  final DateTime selectedDate;
  final Function setSelectedDate;
  const SelectableDates(
      {Key? key,
      required this.selectableDates,
      required this.selectedDate,
      required this.setSelectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: selectableDates.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final date = selectableDates[index];
            return InkWell(
              onTap: () {
                setSelectedDate(date);
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
                    Text(
                        DateFormat.E().format(
                          DateTime(date.year, date.month, date.day),
                        ),
                        style: AppTheme.greySubtitleStyle),
                    Text(
                        DateFormat.d().format(
                          DateTime(date.year, date.month, date.day),
                        ),
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
