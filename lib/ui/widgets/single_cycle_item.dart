import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleCycleItem extends StatelessWidget {
  final MonthlyMensturationModel data;
  const SingleCycleItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: AppTheme.whiteBoxDecoration(),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocalizedText(
                  "period_date",
                  style: AppTheme.titleStyle4.copyWith(color: Colors.black),
                ),
                SizedBox(width: 2),
                Text(
                    '${DateFormat.yMMMEd().format(data.startDate)}-${DateFormat.yMMMEd().format(data.endDate)}',
                    style: AppTheme.articleTextStyle
                        .copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocalizedText(
                  "period_length",
                  style: AppTheme.titleStyle4.copyWith(color: Colors.black),
                ),
                SizedBox(width: 10),
                Text('${data.endDate.difference(data.startDate).inDays}',
                    style: AppTheme.articleTextStyle
                        .copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            data.pregnancyDate != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        "highest_pregnancy_chance",
                        style:
                            AppTheme.titleStyle4.copyWith(color: Colors.black),
                      ),
                      SizedBox(width: 2),
                      Text('${DateFormat.yMMMEd().format(data.pregnancyDate!)}',
                          style: AppTheme.articleTextStyle
                              .copyWith(fontWeight: FontWeight.w500)),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
