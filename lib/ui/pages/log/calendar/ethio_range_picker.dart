import 'package:bertucanfrontend/ui/widgets/ethio_day_names.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abushakir/abushakir.dart';
import 'blocs/blocs.dart';
import 'size_config.dart';
import 'package:get/get.dart';

class RangePickerEthioCalendar extends StatefulWidget {
  @override
  State<RangePickerEthioCalendar> createState() =>
      _RangePickerEthioCalendarState();
}

class _RangePickerEthioCalendarState extends State<RangePickerEthioCalendar> {
  static double widthMultiplier = SizeConfig.widthMultiplier?.toDouble() ?? 1;
  static double heightMultiplier = SizeConfig.heightMultiplier?.toDouble() ?? 1;

  EtDatetime startDate = EtDatetime.now();
  EtDatetime endDate = EtDatetime.now();
  HomeController _homeController = Get.find();
  bool flag = true;
  bool isstartDateSelected = false;
  bool isEndDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            BuildContext prevcontext = context;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: BlocProvider<CalendarBloc>(
                create: (BuildContext context) =>
                    CalendarBloc(currentMoment: ETC.today()),
                child: Scaffold(
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: BlocBuilder<CalendarBloc, CalendarState>(
                        builder: (context, state) {
                          final month = state.moment;
                          ETC current = month;
                          List<Widget> list = [];
                          for (var i = 0; i < 15; i++) {
                            list.add(_daysGridList(context, current));
                            current = current.prevMonth;
                          }
                          return Column(
                            children: <Widget>[
                              _nameAndActions(prevcontext, context, month),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.838 * heightMultiplier),
                                child: DayNames(),
                              ),
                              Expanded(
                                  child: ListView(
                                reverse: true,
                                children: list,
                              )),
                            ],
                          );
                        },
                      ))
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _nameAndActions(
      BuildContext prevcontext, BuildContext context, ETC a) {
    ETC slectedETCStartDate =
        ETC(year: startDate.year, month: startDate.month, day: startDate.day);
    ETC slectedETCEndDate =
        ETC(year: endDate.year, month: endDate.month, day: endDate.day);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 4.63 * widthMultiplier,
          vertical: 1.838 * heightMultiplier),
      height: 20 * heightMultiplier,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.orange, boxShadow: [
        BoxShadow(
            blurRadius: 2, color: Colors.black38, offset: Offset(0.1, 0.1))
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(prevcontext),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
              TextButton(
                  onPressed: () {
                    _homeController.setPrevStartDate(startDate);
                    _homeController.setPrevEndDate(endDate);
                    Get.back();
                  },
                  child: const Text("SAVE",
                      style: TextStyle(color: Colors.white70)))
            ],
          ),
          const Text(
            "የቀን ክልል ይምረጡ",
            style: TextStyle(color: Colors.white),
          ),
          isEndDateSelected && isstartDateSelected
              ? Text(
                  "${slectedETCStartDate.monthName} ${slectedETCStartDate.day} - ${slectedETCEndDate.monthName} ${slectedETCEndDate.day}",
                  style: const TextStyle(color: Colors.white70, fontSize: 24),
                )
              : isstartDateSelected && !isEndDateSelected
                  ? Text(
                      "${slectedETCStartDate.monthName} ${slectedETCStartDate.day} - የመጨረሻ ቀን",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 24),
                    )
                  : const Text(
                      "የመጀመሪያ ቀን - የመጨረሻ ቀን",
                      style: TextStyle(color: Colors.white70, fontSize: 24),
                    ),
        ],
      ),
    );
  }

  Widget _daysGridList(BuildContext context, ETC a) {
    HomeController _homeController = Get.find();
    int lengthOfMonthdays = a.monthDays().toList().length;
    int valueAtIndex3 = a.monthDays().toList()[0][3];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 6.0 * widthMultiplier),
          child: Text("${a.monthName} ${a.year}"),
        ),
        GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.symmetric(
                horizontal: 0.694 * widthMultiplier,
                vertical: 0.3676 * heightMultiplier),
            crossAxisCount: 7,
            children: List.generate(
              lengthOfMonthdays + valueAtIndex3,
              (index) {
                if (a.monthDays().toList()[0][3] > 0 &&
                    index < a.monthDays().toList()[0][3]) {
                  // NULL printer
                  return Container();
                } else {
                  // mark if currentday == today
                  List monthDaysList = a.monthDays().toList();
                  EtDatetime current_date = EtDatetime(
                      year: monthDaysList[(index - monthDaysList[0][3]).toInt()]
                          [0],
                      month:
                          monthDaysList[(index - monthDaysList[0][3]).toInt()]
                              [1],
                      day: monthDaysList[(index - monthDaysList[0][3]).toInt()]
                          [2]);
                  if (current_date.year == EtDatetime.now().year &&
                      current_date.month == EtDatetime.now().month &&
                      current_date.day == EtDatetime.now().day) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!isstartDateSelected && !isEndDateSelected) {
                              startDate = current_date;
                              // endDate = current_date;
                              isstartDateSelected = true;
                            } else if (isstartDateSelected &&
                                !isEndDateSelected &&
                                current_date.isAfter(startDate
                                    .subtract(const Duration(days: 1)))) {
                              endDate = current_date;
                              isEndDateSelected = true;
                            } else {
                              startDate = current_date;
                              endDate = current_date;
                              isEndDateSelected = false;
                            }
                          });
                        },
                        child: Stack(fit: StackFit.expand, children: [
                          Container(
                            alignment: Alignment.center,
                            height: 1.225 * heightMultiplier,
                            width: 2.315 * widthMultiplier,
                            decoration: BoxDecoration(
                                color: current_date.day == endDate.day &&
                                        current_date.month == endDate.month &&
                                        startDate.day != endDate.day &&
                                        startDate.month != endDate
                                    ? Color.fromARGB(104, 255, 153, 0)
                                    : Colors.white,
                                border: Border.all(
                                    color: current_date.day == endDate.day &&
                                            current_date.month ==
                                                endDate.month &&
                                            startDate.day != endDate.day &&
                                            startDate.month != endDate.month
                                        ? Colors.orange
                                        : Colors.transparent),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(80),
                                    bottomRight: Radius.circular(80))),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 1.225 * heightMultiplier,
                            width: 2.315 * widthMultiplier,
                            decoration: BoxDecoration(
                              color: current_date.day == startDate.day &&
                                          current_date.month ==
                                              startDate.month ||
                                      current_date.day == endDate.day &&
                                          current_date.month == endDate.month
                                  ? Colors.orange
                                  : Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: Text(
                              "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                              style: TextStyle(
                                  color: current_date.day == startDate.day &&
                                          current_date.month == startDate.month
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          )
                        ]));
                  } else if (current_date.isAfter(EtDatetime.now())) {
                    return Container(
                        alignment: Alignment.center,
                        height: 1.225 * heightMultiplier,
                        width: 2.315 * widthMultiplier,
                        child: Text(
                          "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                          style: const TextStyle(color: Colors.black45),
                        ));
                  } else if (current_date.isAfter(startDate) &&
                      current_date
                          .isBefore(endDate.add(const Duration(days: 1)))) {
                    //the Right one on which the end date is located on
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!isstartDateSelected && !isEndDateSelected) {
                              startDate = current_date;
                              endDate = current_date;
                              isstartDateSelected = true;
                            } else if (isstartDateSelected &&
                                !isEndDateSelected &&
                                current_date.isAfter(startDate
                                    .subtract(const Duration(days: 1)))) {
                              endDate = current_date;
                              isEndDateSelected = true;
                            } else {
                              startDate = current_date;
                              endDate = current_date;
                              isEndDateSelected = false;
                            }
                          });
                        },
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            // height: 1.225 * heightMultiplier,
                            // width: (2.315 * widthMultiplier),
                            decoration: BoxDecoration(
                                color: (current_date.day == endDate.day &&
                                        current_date.month == endDate.month)
                                    ? Color.fromARGB(104, 255, 153, 0)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(80),
                                    bottomRight: Radius.circular(80))),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: (current_date.day == startDate.day &&
                                          current_date.month ==
                                              startDate.month) ||
                                      (current_date.day == endDate.day &&
                                          current_date.month == endDate.month)
                                  ? Colors.orange
                                  : Color.fromARGB(104, 255, 153, 0),
                              borderRadius: (current_date.day ==
                                          startDate.day &&
                                      current_date.month == startDate.month)
                                  ? const BorderRadius.only(
                                      bottomLeft: Radius.circular(80),
                                      topLeft: Radius.circular(80))
                                  : (current_date.day == endDate.day &&
                                          current_date.month == endDate.month)
                                      ? const BorderRadius.all(
                                          Radius.circular(80))
                                      : BorderRadius.zero,
                            ),
                          )
                        ]));
                  }

                  // the left one the one tha start date is located on
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!isstartDateSelected && !isEndDateSelected) {
                            startDate = current_date;
                            endDate = current_date;
                            isstartDateSelected = true;
                          } else if (isstartDateSelected &&
                              !isEndDateSelected &&
                              current_date.isAfter(startDate
                                  .subtract(const Duration(days: 1)))) {
                            endDate = current_date;
                            isEndDateSelected = true;
                          } else {
                            startDate = current_date;
                            endDate = current_date;
                            isEndDateSelected = false;
                          }
                        });
                      },
                      child: Stack(fit: StackFit.expand, children: [
                        Container(
                          alignment: Alignment.center,
                          // height: 1.225 * heightMultiplier,
                          // width: (2.315 * widthMultiplier),
                          decoration: BoxDecoration(
                              color: isEndDateSelected &&
                                      current_date.day == startDate.day &&
                                      current_date.month == startDate.month &&
                                      startDate.day != endDate.day
                                  ? Color.fromARGB(104, 255, 153, 0)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(80),
                                  bottomLeft: Radius.circular(80))),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 1.225 * heightMultiplier,
                          width: 2.315 * widthMultiplier,
                          decoration: BoxDecoration(
                            color: (current_date.day == startDate.day &&
                                        current_date.month ==
                                            startDate.month) ||
                                    (current_date.day == endDate.day &&
                                        current_date.month == endDate.month)
                                ? Colors.orange
                                : Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                          ),
                          child: Text(
                            "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                            style: TextStyle(
                                color: current_date.day == startDate.day &&
                                        current_date.month == startDate.month
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        )
                      ]));
                }
              },
            )),
      ],
    );
  }
}
