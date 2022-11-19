import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class LogPage extends StatelessWidget {
  LogPage({Key? key}) : super(key: key);
  final DateRangePickerController _controller = DateRangePickerController();
  HomeController homeController = Get.find();
  AuthController _authController = Get.find();
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TableCalendar(
              headerStyle: HeaderStyle(formatButtonVisible: false),
              focusedDay: DateTime.now(),
              firstDay: DateTime.now().subtract(Duration(days: 365)),
              lastDay: DateTime.now().add(Duration(days: 365)),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  var isRed = false;
                  var isOrange = false;
                  var isLessOrange = false;
                  for (var element in homeController.predictedDates) {
                    if (day.isBefore(element.endDate.add(Duration(days: 1))) &&
                        day.isAfter(element.startDate)) {
                      isRed = true;
                    } else if (element.pregnancyDate != null) {
                      if ((day
                                  .difference(element.pregnancyDate!)
                                  .abs()
                                  .inDays <=
                              1)
                          // ||  day.day == element.pregnancyDate!.day
                          ) {
                        isOrange = true;
                      } else if (day.isBefore(element.pregnancyDate!
                              .subtract(Duration(days: 2))) &&
                          day.isAfter(element.endDate)) {
                        isLessOrange = true;
                      }
                    }
                  }
                  return isRed
                      ? Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                              child: Text(
                            day.day.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      : isOrange
                          ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 152, 78),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              width: 40,
                              height: 40,
                              child: Center(child: Text(day.day.toString())),
                            )
                          : isLessOrange
                              ? Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 248, 152, 78),
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  width: 40,
                                  height: 40,
                                  child:
                                      Center(child: Text(day.day.toString())),
                                )
                              : null;
                },
              ),
            ),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      LocalizedText(
                        'on_period',
                        style: AppTheme.titleStyle4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      LocalizedText(
                        'good_chance_of_pregnancy',
                        style: AppTheme.titleStyle4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 152, 78),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      LocalizedText(
                        'best_chance_of_pregnancy',
                        style: AppTheme.titleStyle4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
