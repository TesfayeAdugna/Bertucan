import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abushakir/abushakir.dart';
import 'blocs/blocs.dart';
import 'size_config.dart';

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
  bool flag = true;
  bool isstartDateSelected = false;
  bool isEndDateSelected = false;

  final List<Text> _days = [
    const Text(
      "ሰ",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
    const Text("ማ",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    const Text("ረ",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    const Text("ሐ",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    const Text("አ",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    const Text("ቅ",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    const Text("እ",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  ];

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
                            if (i == 0) {
                              list.add(Container(
                                height: 37.5 * heightMultiplier,
                              ));
                            } else {
                              list.add(_daysGridList(context, current));
                              current = current.prevMonth;
                            }
                          }
                          return Column(
                            children: <Widget>[
                              _nameAndActions(prevcontext, context, month),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.838 * heightMultiplier),
                                child: _dayNames(),
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 4.63 * widthMultiplier,
              vertical: 1.838 * heightMultiplier),
          color: Colors.orange,
          height: 20 * heightMultiplier,
          width: double.infinity,
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
                        return Navigator.pop(prevcontext);
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
                          style: const TextStyle(color: Colors.white70, fontSize: 24),
                        )
                      : const Text(
                          "የመጀመሪያ ቀን - የመጨረሻ ቀን",
                          style: TextStyle(color: Colors.white70, fontSize: 24),
                        ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dayNames() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _days.asMap().entries.map((MapEntry map) {
          return Container(
            child: map.value,
          );
        }).toList());
  }

  Widget _daysGridList(BuildContext context, ETC a) {
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
                        child: Container(
                          alignment: Alignment.center,
                          height: 1.225 * heightMultiplier,
                          width: 2.315 * widthMultiplier,
                          decoration: BoxDecoration(
                            color: current_date.day == startDate.day &&
                                    current_date.month == startDate.month
                                ? Colors.orange
                                : Colors.white,
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(55),
                          ),
                          child: Text(
                            "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                            style: TextStyle(
                                color: current_date.day == startDate.day &&
                                        current_date.month == startDate.month
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ));
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
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                          color: (current_date.day == startDate.day &&
                                  current_date.month == startDate.month) || (current_date.day == endDate.day &&
                                  current_date.month == endDate.month)
                              ? Colors.orange
                              : Color.fromARGB(104, 255, 153, 0),
                          borderRadius: (current_date.day == startDate.day &&
                                  current_date.month == startDate.month)
                              ? const BorderRadius.only(
                                  bottomLeft: Radius.circular(80),
                                  topLeft: Radius.circular(80))
                              : (current_date.day == endDate.day &&
                                      current_date.month == endDate.month)
                                  ? const BorderRadius.only(
                                      bottomRight: Radius.circular(80),
                                      topRight: Radius.circular(80))
                                  : BorderRadius.zero,
                        ),
                        ));
                  }
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
                      child: Container(
                        alignment: Alignment.center,
                        height: 1.225 * heightMultiplier,
                        width: 2.315 * widthMultiplier,
                        decoration: BoxDecoration(
                          color: (current_date.day == startDate.day &&
                                  current_date.month == startDate.month) || (current_date.day == endDate.day &&
                                  current_date.month == endDate.month)
                              ? Colors.orange
                              : Colors.transparent,
                          borderRadius: (current_date.day == startDate.day &&
                                  current_date.month == startDate.month)
                              ? const BorderRadius.only(
                                  bottomLeft: Radius.circular(80),
                                  topLeft: Radius.circular(80))
                              : (current_date.day == endDate.day &&
                                      current_date.month == endDate.month)
                                  ? const BorderRadius.only(
                                      bottomRight: Radius.circular(80),
                                      topRight: Radius.circular(80))
                                  : BorderRadius.circular(80),
                        ),
                        child: Text(
                          "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                          style: TextStyle(
                              color: current_date.day == startDate.day &&
                                      current_date.month == startDate.month
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ));
                }
              },
            )),
      ],
    );
  }
}
