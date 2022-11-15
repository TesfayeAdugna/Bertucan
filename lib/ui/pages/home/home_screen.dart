import 'dart:developer';

import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/daily_insights.dart';
import 'package:bertucanfrontend/ui/components/phase_container.dart';
import 'package:bertucanfrontend/ui/components/selectable_dates.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/ui/pages/intro/log_period_info.dart';
import 'package:bertucanfrontend/ui/widgets/ModalProgressHUD.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:bertucanfrontend/ui/widgets/stat_container.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.find();
  final AuthController _authController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeController.getPredictedDates();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() {
          if (_homeController.predictedDates.isNotEmpty) {
            int periodIn = 0;
            DateTime today = DateTime.now();
            if (today.isAfter(_homeController.currentMenstruation.startDate)) {
              if (today.isBefore(_homeController.currentMenstruation.endDate)) {
                periodIn = 0;
              } else {
                periodIn = _homeController.currentMenstruation.startDate
                    .add(Duration(
                        days: _homeController.userLogData?.daysToStart ?? 0))
                    .difference(today)
                    .inDays;
              }
            } else {
              periodIn = _homeController.currentMenstruation.startDate
                  .difference(today)
                  .inDays;
            }
            return Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                    DateFormat.yMMMd()
                                        .format(_homeController.selectedDate),
                                    style: AppTheme.titleStyle3),
                                SizedBox()
                                // Align(
                                //   alignment: Alignment.topLeft,
                                //   child: IconButton(
                                //       onPressed: () {
                                //         Get.toNamed(Routes.logPage);
                                //       },
                                //       icon: const Icon(
                                //         Icons.calendar_month_outlined,
                                //         size: 25,
                                //       )),
                                // ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.logPage);
                                },
                                icon:
                                    const Icon(Icons.calendar_month_outlined)),
                            // IconButton(
                            //     onPressed: () {
                            //       // Get.toNamed(Routes.notificationPage);
                            //       Get.to(LogPeriodInfoPage());
                            //     },
                            //     icon: const Icon(
                            //       Icons.notifications,
                            //       color: Colors.amber,
                            //       size: 40,
                            //     ))
                          ],
                        ),
                        SelectableDates(
                          selectedDate: _homeController.selectedDate,
                          setSelectedDate: _homeController.setSelectedDate,
                          selectableDates: _homeController.selectableDates,
                        ),
                        const SizedBox(height: 20),
                        PhaseContainer(
                            data: _homeController.getMenstruationCycleForDate(
                                _homeController.selectedDate),
                            date: _homeController.selectedDate,
                            onEdit: _homeController.editLogData,
                            userLogData: _homeController.userLogData!),
                        const SizedBox(height: 20),
                        _authController.user.id != -1
                            ? Text(
                                "${translate("hi")} ${_authController.user.first_name} ",
                                style: AppTheme.boldTitle,
                              )
                            : SizedBox(),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              // StatContainer(
                              //     label: "weight",
                              //     stat: "65",
                              //     unit: "kg",
                              //     color: AppTheme.orange),
                              StatContainer(
                                  label: periodIn != 0
                                      ? "period_in"
                                      : "you_are_currently_on_period",
                                  stat: (periodIn).toString(),
                                  unit: "days",
                                  color: AppTheme.green),
                              // StatContainer(
                              //     label: "water",
                              //     stat: "3",
                              //     unit: "litters",
                              //     color: AppTheme.blue)
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        DailyInsights(),
                        const SizedBox(height: 30),
                        // const LocalizedText(
                        //   "my_cycles",
                        //   style: AppTheme.boldTitle,
                        // ),
                        // const SizedBox(height: 15),
                        // Container(
                        //   decoration: AppTheme.textFieldDecoration(),
                        //   padding: const EdgeInsets.all(20),
                        //   child: Column(
                        //     children: [myCycleRow(), myCycleRow()],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: AppTheme.whiteBoxDecoration(),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LocalizedText(
                                    "cycles_history",
                                    style: AppTheme.titleStyle4
                                        .copyWith(color: Colors.black),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.cyclesHistoryPage);
                                    },
                                    child: Row(
                                      children: [
                                        LocalizedText(
                                          "see_all",
                                          style: AppTheme.titleStyle4.copyWith(
                                              color: AppTheme.textGrey),
                                        ),
                                        const Icon(
                                          Icons.chevron_right,
                                          color: AppTheme.textGrey,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 0.2,
                                color: AppTheme.hintGrey,
                                width: double.maxFinite,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      LocalizedText(
                                        "current_cycle",
                                        style: AppTheme.titleStyle4
                                            .copyWith(color: Colors.black),
                                      ),
                                      Text(
                                        " : ${_homeController.getUserLogData().daysToStart}",
                                        style: AppTheme.titleStyle4
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      LocalizedText(
                                        "started at",
                                        style: AppTheme.articleTextStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        DateFormat.MMMd().format(_homeController
                                            .getUserLogData()
                                            .startDate),
                                        style: AppTheme.articleTextStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 0.2,
                                color: AppTheme.hintGrey,
                                width: double.maxFinite,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LocalizedText(
                                        "current_month_period",
                                        style: AppTheme.titleStyle4
                                            .copyWith(color: Colors.black),
                                      ),
                                      Text(
                                        "${DateFormat.MMMd().format(_homeController.getUserLogData().startDate)}-${DateFormat.MMMd().format(_homeController.getUserLogData().endDate)}",
                                        style: AppTheme.articleTextStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 0.2,
                                color: AppTheme.hintGrey,
                                width: double.maxFinite,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              Theme(
                                data: _buildShrineTheme(),
                                child: Builder(builder: (context) {
                                  return InkWell(
                                    onTap: () async {
                                      await showDateRangePicker(
                                              context: context,
                                              firstDate: DateTime.now()
                                                  .subtract(
                                                      Duration(days: 365)),
                                              lastDate: DateTime.now())
                                          .then((value) {
                                        if (value != null) {
                                          _homeController.addPreviousCycle(
                                              MonthlyMensturationModel(
                                                  startDate: value.start,
                                                  endDate: value.end));
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add_circle,
                                            color: AppTheme.primaryColor,
                                            size: 40,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          LocalizedText(
                                            "log_previous_cycles",
                                            style: AppTheme.titleStyle4
                                                .copyWith(
                                                    color:
                                                        AppTheme.primaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              )
                            ],
                          ),
                        )
                      ]),
                ));
          } else {
            return Center(
              child: RoundedButton(
                onPressed: () {
                  _homeController.getPredictedDates();
                },
                text: 'retry',
              ),
            );
          }
        }),
        Obx(() =>
            ModalProgressHUD(inAsyncCall: _homeController.status.isLoading))
      ],
    );
  }

  myCycleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocalizedText("previous_cycle_length",
                  style: AppTheme.greySubtitleStyle),
              Row(
                children: [
                  Text("37", style: AppTheme.titleStyle2),
                  LocalizedText("days", style: AppTheme.titleStyle2)
                ],
              ),
            ],
          ),
          LocalizedText(
            "abnormal",
            style:
                AppTheme.greySubtitleStyle.copyWith(color: AppTheme.textBlack),
          ),
        ],
      ),
    );
  }

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: _shrineColorScheme,
      toggleableActiveColor: AppTheme.primaryColor,
      accentColor: AppTheme.primaryColor,
      primaryColor: AppTheme.primaryColor,
      buttonColor: AppTheme.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      // textSelectionColor: AppTheme.primaryColor,
      errorColor: Colors.red,
      buttonTheme: ButtonThemeData(
        colorScheme: _shrineColorScheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: AppTheme.primaryColor);
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          caption: base.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          button: base.button!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: AppTheme.primaryColor,
          bodyColor: AppTheme.primaryColor,
        );
  }

  ColorScheme _shrineColorScheme = ColorScheme(
    primary: AppTheme.primaryColor,
    primaryVariant: AppTheme.primaryColor,
    secondary: AppTheme.primaryColor,
    secondaryVariant: AppTheme.primaryColor,
    surface: AppTheme.primaryColor,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.white,
    onError: Colors.red,
    brightness: Brightness.light,
  );
}
