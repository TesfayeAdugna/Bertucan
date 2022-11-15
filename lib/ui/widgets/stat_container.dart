import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';

class StatContainer extends StatelessWidget {
  final String label;
  final String stat;
  final String unit;
  final Color color;
  const StatContainer({
    Key? key,
    required this.label,
    required this.stat,
    required this.color,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(children: [
        SizedBox(height: stat != '0' ? 20 : 0),
        LocalizedText(
          label,
          style: stat != "0" ? AppTheme.normalTextStyle : AppTheme.titleStyle,
        ),
        if (stat != "0") ...[
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stat,
                style:
                    AppTheme.titleStyle2.copyWith(color: AppTheme.primaryColor),
              ),
              LocalizedText(
                unit,
                style: AppTheme.greySubtitleStyle
                    .copyWith(color: AppTheme.primaryColor),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ]
      ]),
    );
  }
}
