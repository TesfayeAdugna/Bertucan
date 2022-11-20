import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abushakir/abushakir.dart';
import 'package:get/get.dart';
import 'blocs/blocs.dart';
import 'size_config.dart';

class EthioCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MyCalendar();
          },
        );
      },
    );
  }
}

class MyCalendar extends StatelessWidget {
  static double textMultiplier = SizeConfig.textMultiplier?.toDouble() ?? 1;
  static double imageSizeMultiplier =
      SizeConfig.imageSizeMultiplier?.toDouble() ?? 1;
  static double widthMultiplier = SizeConfig.widthMultiplier?.toDouble() ?? 1;
  static double heightMultiplier = SizeConfig.heightMultiplier?.toDouble() ?? 1;

  HomeController homeController = Get.find();

  final List<Text> _days = [
    Text(
      "ሰ",
      style: TextStyle(
          fontSize: 2.08335 * textMultiplier, fontWeight: FontWeight.bold),
    ),
    Text("ማ",
        style: TextStyle(
            fontSize: 2.08335 * textMultiplier, fontWeight: FontWeight.bold)),
    Text("ረ",
        style: TextStyle(
            fontSize: 2.08335 * textMultiplier, fontWeight: FontWeight.bold)),
    Text("ሐ",
        style: TextStyle(
            fontSize: 2.08335 * textMultiplier, fontWeight: FontWeight.bold)),
    Text("አ",
        style: TextStyle(
            fontSize: 2.08335 * textMultiplier, fontWeight: FontWeight.bold)),
    Text("ቅ",
        style: TextStyle(
            fontSize: 2.08335 * textMultiplier, fontWeight: FontWeight.bold)),
    Text("እ",
        style: TextStyle(
            fontSize: 2.08335 * textMultiplier, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CalendarBloc>(
        create: (BuildContext context) =>
            CalendarBloc(currentMoment: ETC.today()),
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close)),
              Expanded(child: BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  final month = state.moment;
                  return Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: _nameAndActions(context, month)),
                      _dayNames(),
                      Expanded(
                          child: GestureDetector(
                              onPanEnd: (e) {
                                if (e.velocity.pixelsPerSecond.dx < 0) {
                                  BlocProvider.of<CalendarBloc>(context)
                                      .add(NextMonthCalendar(month));
                                } else if (e.velocity.pixelsPerSecond.dx > 0) {
                                  BlocProvider.of<CalendarBloc>(context)
                                      .add(PrevMonthCalendar(month));
                                }
                              },
                              child: ListView(
                                children: [
                                  _daysGridList(context, month),
                                  const Divider(),
                                  const ListTile(
                                      leading: CircleAvatar(
                                          backgroundColor: Colors.red),
                                      title: Text("በ ወር አበባ ላይ")),
                                  ListTile(
                                      leading: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.orange),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20))),
                                      ),
                                      title: const Text("ጥሩ የ እርዝግዝና እድል")),
                                  const ListTile(
                                      leading: CircleAvatar(
                                          backgroundColor: Colors.orange),
                                      title: Text("በጣም ከፍተኛ የ እርግዝና እድል")),
                                ],
                              ))),
                    ],
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameAndActions(BuildContext context, ETC a) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              color: Colors.black,
              iconSize: 6.94 * imageSizeMultiplier,
              onPressed: () {
                BlocProvider.of<CalendarBloc>(context)
                    .add(PrevMonthCalendar(a));
              },
            ),
            Text(
              "${a.monthName}, ${a.year}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 3.177 * textMultiplier,
                  color: Colors.black),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          iconSize: 6.94 * imageSizeMultiplier,
          onPressed: () {
            BlocProvider.of<CalendarBloc>(context).add(NextMonthCalendar(a));
          },
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
            padding: EdgeInsets.symmetric(
                horizontal: 4.63 * widthMultiplier,
                vertical: 1.838 * heightMultiplier),
          );
        }).toList());
  }

  Widget _daysGridList(BuildContext context, ETC a) {
    int lengthOfMonthdays = a.monthDays().toList().length;
    int valueAtIndex3 = a.monthDays().toList()[0][3];
    // coloring work started here.
    Set<String> RedDays = {};
    Set<String> OrangeDays = {};
    Set<String> LessOrangeDays = {};
    DateTime firstday = DateTime.now();
    DateTime lastday = DateTime.now().add(Duration(days: 366));
    for (DateTime indexDay = DateTime(firstday.year, firstday.month, 1);
        indexDay.isBefore(lastday);
        indexDay = indexDay.add(Duration(days: 1))) {
      EtDatetime ethiodate = EtDatetime.fromMillisecondsSinceEpoch(
          indexDay.millisecondsSinceEpoch);
      for (var element in homeController.predictedDates) {
        if (indexDay.isBefore(element.endDate.add(Duration(days: 1))) &&
            indexDay.isAfter(element.startDate)) {
          RedDays.add(EtDatetime(
                  year: ethiodate.year,
                  month: ethiodate.month,
                  day: ethiodate.day)
              .toString());
        } else if (element.pregnancyDate != null) {
          if ((indexDay.difference(element.pregnancyDate!).abs().inDays <= 1)) {
            OrangeDays.add(EtDatetime(
                    year: ethiodate.year,
                    month: ethiodate.month,
                    day: ethiodate.day)
                .toString());
          } else if (indexDay.isBefore(
                  element.pregnancyDate!.subtract(Duration(days: 2))) &&
              indexDay.isAfter(element.endDate)) {
            LessOrangeDays.add(EtDatetime(
                    year: ethiodate.year,
                    month: ethiodate.month,
                    day: ethiodate.day)
                .toString());
          }
        }
      }
    }
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(
          horizontal: 0.694 * widthMultiplier,
          vertical: 0.3676 * heightMultiplier),
      crossAxisCount: 7,
      children: List.generate(lengthOfMonthdays + valueAtIndex3, (index) {
        if (a.monthDays().toList()[0][3] > 0 &&
            index < a.monthDays().toList()[0][3]) {
          // NULL printer
          return SizedBox();
        } else {
          // mark if currentday == today
          List monthDaysList = a.monthDays().toList();
          if (monthDaysList[(index - monthDaysList[0][3]).toInt()][0] ==
                  EtDatetime.now().year &&
              monthDaysList[(index - monthDaysList[0][3]).toInt()][1] ==
                  EtDatetime.now().month &&
              monthDaysList[(index - monthDaysList[0][3]).toInt()][2] ==
                  EtDatetime.now().day) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0.98 * heightMultiplier,
                  horizontal: 1.852 * widthMultiplier),
              child: Container(
                alignment: Alignment.center,
                height: 1.225 * heightMultiplier,
                width: 2.315 * widthMultiplier,
                child: Text(
                  "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(150, 187, 160, 222),
                ),
              ),
            );
          }
          return RedDays.contains(EtDatetime(
                      year: monthDaysList[(index - monthDaysList[0][3]).toInt()]
                          [0],
                      month: monthDaysList[(index - monthDaysList[0][3]).toInt()]
                          [1],
                      day: monthDaysList[(index - monthDaysList[0][3]).toInt()]
                          [2])
                  .toString())
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.98 * heightMultiplier,
                      horizontal: 1.852 * widthMultiplier),
                  child: Container(
                    alignment: Alignment.center,
                    height: 1.225 * heightMultiplier,
                    width: 2.315 * widthMultiplier,
                    child: Text(
                      "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                )
              : OrangeDays.contains(
                      EtDatetime(year: monthDaysList[(index - monthDaysList[0][3]).toInt()][0], month: monthDaysList[(index - monthDaysList[0][3]).toInt()][1], day: monthDaysList[(index - monthDaysList[0][3]).toInt()][2])
                          .toString())
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.98 * heightMultiplier,
                          horizontal: 1.852 * widthMultiplier),
                      child: Container(
                        alignment: Alignment.center,
                        height: 1.225 * heightMultiplier,
                        width: 2.315 * widthMultiplier,
                        child: Text(
                          "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                          style: const TextStyle(color: Colors.black),
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : LessOrangeDays.contains(EtDatetime(
                              year: monthDaysList[(index - monthDaysList[0][3]).toInt()][0],
                              month: monthDaysList[(index - monthDaysList[0][3]).toInt()][1],
                              day: monthDaysList[(index - monthDaysList[0][3]).toInt()][2])
                          .toString())
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.98 * heightMultiplier,
                              horizontal: 1.852 * widthMultiplier),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            child: Text(
                              "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(8, 255, 153, 0),
                              border: Border.all(color: Colors.orange),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.98 * heightMultiplier,
                              horizontal: 1.852 * widthMultiplier),
                          child: Container(
                            alignment: Alignment.center,
                            height: 1.225 * heightMultiplier,
                            width: 2.315 * widthMultiplier,
                            child: Text(
                              "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        );
        }
      }),
    );
  }
}
