import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abushakir/abushakir.dart';
import 'blocs/blocs.dart';
import 'size_config.dart';

class EthioDatePicker extends StatelessWidget {
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

  ETC selected_date = ETC.today();

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
                                ],
                              ))),
                    ],
                  );
                },
              )),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(),
                    SizedBox(),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("CANCEL",
                            style: TextStyle(color: Colors.orange))),
                    TextButton(
                        onPressed: () {},
                        child:
                            Text("OK", style: TextStyle(color: Colors.orange)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameAndActions(BuildContext context, ETC a) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 4.63 * widthMultiplier,
              vertical: 1.838 * heightMultiplier),
          color: Colors.orange,
          height: 15 * heightMultiplier,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ቀን ይምረጡ",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "${(selected_date.monthDays(weekDayName: true).toList())[selected_date.day-1][3]}, ${selected_date.monthName} ${selected_date.day}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 3.177 * textMultiplier,
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
                style: TextStyle(
                    fontSize: 2.177 * textMultiplier,
                    color: Colors.black),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left),
                    color: Colors.black,
                    iconSize: 6.94 * imageSizeMultiplier,
                    onPressed: () {
                      BlocProvider.of<CalendarBloc>(context)
                          .add(PrevMonthCalendar(a));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    iconSize: 6.94 * imageSizeMultiplier,
                    onPressed: () {
                      BlocProvider.of<CalendarBloc>(context)
                          .add(NextMonthCalendar(a));
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
            padding: EdgeInsets.symmetric(
                horizontal: 4.63 * widthMultiplier,
                vertical: 1.838 * heightMultiplier),
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
              return GestureDetector(
                  child: Container(
                alignment: Alignment.center,
                height: 1.225 * heightMultiplier,
                width: 2.315 * widthMultiplier,
                child: const Text(""),
              ));
            } else {
              // mark if currentday == today
              List monthDaysList = a.monthDays().toList();
              if (monthDaysList[(index - monthDaysList[0][3]).toInt()][0] ==
                      EtDatetime.now().year &&
                  monthDaysList[(index - monthDaysList[0][3]).toInt()][1] ==
                      EtDatetime.now().month &&
                  monthDaysList[(index - monthDaysList[0][3]).toInt()][2] ==
                      EtDatetime.now().day) {
                return GestureDetector(
                    onTap: () => print("hello there"),
                    child: Container(
                      alignment: Alignment.center,
                      height: 1.225 * heightMultiplier,
                      width: 2.315 * widthMultiplier,
                      child: Text(
                        "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                        style: TextStyle(color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(55),
                      ),
                    ));
              }
              return GestureDetector(
                  onTap: () => print("whatever"),
                  child: Container(
                    alignment: Alignment.center,
                    height: 1.225 * heightMultiplier,
                    width: 2.315 * widthMultiplier,
                    child: Text(
                      "${a.monthDays().toList()[(index - a.monthDays().toList()[0][3]).toInt()][2]}",
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ));
            }
          },
        ));
  }
}
