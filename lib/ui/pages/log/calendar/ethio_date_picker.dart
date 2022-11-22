import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abushakir/abushakir.dart';
import 'blocs/blocs.dart';
import 'size_config.dart';

class SelectableEthioCalendar extends StatefulWidget {
  @override
  State<SelectableEthioCalendar> createState() =>
      _SelectableEthioCalendarState();
}

class _SelectableEthioCalendarState extends State<SelectableEthioCalendar> {
  static double imageSizeMultiplier = SizeConfig.imageSizeMultiplier?.toDouble() ?? 1;
  static double widthMultiplier = SizeConfig.widthMultiplier?.toDouble() ?? 1;
  static double heightMultiplier = SizeConfig.heightMultiplier?.toDouble() ?? 1;

  EtDatetime selected_date = EtDatetime.now();
  bool flag = true;

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
                          return Column(
                            children: <Widget>[
                              _nameAndActions(context, month),
                              _dayNames(),
                              Expanded(
                                  child: GestureDetector(
                                      onPanEnd: (e) {
                                        if (e.velocity.pixelsPerSecond.dx < 0 &&
                                            flag == false) {
                                          BlocProvider.of<CalendarBloc>(context)
                                              .add(NextMonthCalendar(month));
                                          flag = true;
                                        } else if (e.velocity.pixelsPerSecond
                                                    .dx >
                                                0 &&
                                            flag) {
                                          BlocProvider.of<CalendarBloc>(context)
                                              .add(PrevMonthCalendar(month));
                                          flag = false;
                                        }
                                      },
                                      child: ListView(
                                        children: [
                                          _daysGridList(context, month),
                                        ],
                                      ))),
                            ],
                          );
                        },
                      )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("CANCEL",
                                        style:
                                            TextStyle(color: Colors.orange))),
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(
                                          context, selected_date);
                                    },
                                    child: const Text("OK",
                                        style: TextStyle(color: Colors.orange)))
                              ],
                            )
                          ],
                        ),
                      ),
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

  Widget _nameAndActions(BuildContext context, ETC a) {
    ETC slected_ETC_date = ETC(
        year: selected_date.year,
        month: selected_date.month,
        day: selected_date.day);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ቀን ይምረጡ",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "${(slected_ETC_date.monthDays(weekDayName: true).toList())[slected_ETC_date.day - 1][3]}, ${slected_ETC_date.monthName} ${slected_ETC_date.day}",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.63 * widthMultiplier),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${a.monthName} ${a.year}",
                style: const TextStyle(color: Colors.black),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: flag ? Colors.black : Colors.black45,
                    ),
                    color: Colors.black,
                    iconSize: 6.94 * imageSizeMultiplier,
                    onPressed: () {
                      if (flag) {
                        BlocProvider.of<CalendarBloc>(context)
                            .add(PrevMonthCalendar(a));
                        flag = false;
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: flag ? Colors.black45 : Colors.black,
                    ),
                    iconSize: 6.94 * imageSizeMultiplier,
                    onPressed: () {
                      if (flag == false) {
                        BlocProvider.of<CalendarBloc>(context)
                            .add(NextMonthCalendar(a));
                        flag = true;
                      }
                    },
                  ),
                ],
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
    return GridView.count(
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
                  year: monthDaysList[(index - monthDaysList[0][3]).toInt()][0],
                  month: monthDaysList[(index - monthDaysList[0][3]).toInt()]
                      [1],
                  day: monthDaysList[(index - monthDaysList[0][3]).toInt()][2]);
              if (current_date.year == EtDatetime.now().year &&
                  current_date.month == EtDatetime.now().month &&
                  current_date.day == EtDatetime.now().day) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_date = current_date;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 1.225 * heightMultiplier,
                      width: 2.315 * widthMultiplier,
                      child: Text(
                        "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                        style: const TextStyle(color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                        color: current_date.day == selected_date.day &&
                                current_date.month == selected_date.month
                            ? Colors.orange
                            : Colors.white,
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(55),
                      ),
                    ));
              } else if (current_date.isAfter(EtDatetime.now()) ||
                  current_date.isBefore(
                      EtDatetime.now().subtract(const Duration(days: 30)))) {
                return Container(
                  alignment: Alignment.center,
                  height: 1.225 * heightMultiplier,
                  width: 2.315 * widthMultiplier,
                  child: Text(
                    "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                    style: const TextStyle(color: Colors.black45),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(80),
                  ),
                );
              }
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected_date = current_date;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 1.225 * heightMultiplier,
                    width: 2.315 * widthMultiplier,
                    child: Text(
                      "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                      color: current_date.day == selected_date.day &&
                              current_date.month == selected_date.month
                          ? Colors.orange
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ));
            }
          },
        ));
  }
}
