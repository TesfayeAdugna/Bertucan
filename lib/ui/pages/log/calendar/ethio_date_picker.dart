import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abushakir/abushakir.dart';
import 'blocs/blocs.dart';
import 'size_config.dart';

const List<String> _dayNumbers = [
  "፩",
  "፪",
  "፫",
  "፬",
  "፭",
  "፮",
  "፯",
  "፰",
  "፱",
  "፲",
  "፲፩",
  "፲፪",
  "፲፫",
  "፲፬",
  "፲፭",
  "፲፮",
  "፲፯",
  "፲፰",
  "፲፱",
  "፳",
  "፳፩",
  "፳፪",
  "፳፫",
  "፳፬",
  "፳፭",
  "፳፮",
  "፳፯",
  "፳፰",
  "፳፱",
  "፴",
];
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

  EtDatetime _today = EtDatetime.now();

  List<Text> _days = [
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

  String clockDivision(int hour) {
    if (hour >= 0 && hour <= 4)
      return "ከሌሊቱ";
    else if (hour >= 5 && hour <= 9)
      return "ከጠዋቱ";
    else if (hour >= 10 && hour <= 12)
      return "ከረፋዱ";
    else if (hour >= 13 && hour <= 16)
      return "ከሰአት";
    else
      return "ከምሽቱ";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CalendarBloc>(
        create: (BuildContext context) =>
            CalendarBloc(currentMoment: ETC.today()),
        child: Scaffold(
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close)),
                Expanded(child: BlocBuilder<CalendarBloc, CalendarState>(
                  builder: (context, state) {
                    final month = state.moment;
                    return Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: _nameAndActions(context, month)),
                        _dayNames(),
                        Expanded(
                            child: GestureDetector(
                                onPanEnd: (e) {
                                  if (e.velocity.pixelsPerSecond.dx < 0) {
                                    BlocProvider.of<CalendarBloc>(context)
                                        .add(NextMonthCalendar(month));
                                  } else if (e.velocity.pixelsPerSecond.dx >
                                      0) {
                                    BlocProvider.of<CalendarBloc>(context)
                                        .add(PrevMonthCalendar(month));
                                  }
                                },
                                child: ListView(
                                  children: [
                                    _daysGridList(context, month),
                                    Divider(),
                                    ListTile(
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                        title: Text("ጥሩ የ እርዝግዝና እድል")),
                                    ListTile(
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
              icon: Icon(Icons.chevron_left),
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
          icon: Icon(Icons.chevron_right),
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
    int today;
    int lengthOfMonthdays = a.monthDays().toList().length;
    int valueAtIndex3 = a.monthDays().toList()[0][3];
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
          return GestureDetector (
        
            child:Container(
              alignment: Alignment.center,
              height: 1.225 * heightMultiplier,
              width: 2.315 * widthMultiplier,
              child: Text(
                "",
                style: TextStyle(color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(60),
              ),
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
            return GestureDetector (
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
                  color: Color.fromARGB(179, 116, 71, 183),
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

  Widget _myDate(EtDatetime dt) {
    return Row(
      children: <Widget>[
        Text(
          "${dt.monthGeez} ${_dayNumbers[dt.day - 1]}, ${ConvertToEthiopic(dt.year)}",
          style: TextStyle(
              fontSize: 3.0 * textMultiplier, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
