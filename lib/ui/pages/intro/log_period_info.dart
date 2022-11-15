import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogPeriodInfoPage extends StatefulWidget {
  LogPeriodInfoPage({Key? key}) : super(key: key);

  @override
  State<LogPeriodInfoPage> createState() => _LogPeriodInfoPageState();
}

class _LogPeriodInfoPageState extends State<LogPeriodInfoPage> {
  final TextEditingController _periodLength = TextEditingController();
  final TextEditingController _periodComing = TextEditingController();

  DateTime startDate = DateTime.now();
  bool isPeriodGoing = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: LocalizedText(
                'log_your_cycle',
                style: AppTheme.titleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                label: 'enter_your_period_length',
                controller: _periodLength,
                keyboardType: TextInputType.number,
                hintText: 'enter_your_period_length',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_your_period_length';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                label: 'enter_your_cycle_length',
                controller: _periodComing,
                keyboardType: TextInputType.number,
                hintText: 'enter_your_cycle_length',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_your_cycle_length';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LocalizedText('when_did_your_period_start',
                        style: AppTheme.normalTextStyle),
                    SizedBox(
                      width: 10,
                    ),
                    Theme(
                      data: _buildShrineTheme(),
                      child: Builder(builder: (context) {
                        return TextButton(
                            child: Container(
                                decoration: AppTheme
                                    .primaryColoredRoundedButtonDecoration2(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: LocalizedText(
                                  'select_date',
                                  style: AppTheme.buttonLabelStyle2
                                      .copyWith(color: AppTheme.primaryColor),
                                  textAlign: TextAlign.center,
                                )),
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: startDate,
                                      firstDate: DateTime.now()
                                          .subtract(Duration(days: 30)),
                                      lastDate: DateTime.now())
                                  .then((value) {
                                if (value != null) {
                                  setState(() {
                                    startDate = value;
                                  });
                                }
                              });
                            });
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              alignment: Alignment.center,
              child: TextButton(
                  child: Container(
                      decoration: AppTheme.textFieldDecorations(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: LocalizedText(
                        'done',
                        style: AppTheme.buttonLabelStyle2
                            .copyWith(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      )),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      HomeController homeController = Get.find();
                      homeController.setCurrentPeriodDate(UserLogData(
                          startDate: startDate,
                          endDate: startDate.add(
                              Duration(days: int.parse(_periodLength.text))),
                          daysToEnd: int.parse(_periodLength.text),
                          daysToStart: int.parse(_periodComing.text)));
                      Get.offAndToNamed(Routes.homePage);
                    }
                  }),
            )
          ],
        ),
      ),
    ));
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
      // textSelectionTheme: AppTheme.primaryColor,
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
