import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';

class DailyInsightCard extends StatelessWidget {
  final String title;
  final Widget bottom;
  final Color color;
  final Function()? onPressed;
  const DailyInsightCard(
      {Key? key,
      required this.title,
      required this.bottom,
      this.onPressed,
      this.color = AppTheme.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: AppTheme.insightCardDecoration().copyWith(color: color),
        margin: const EdgeInsets.all(10),
        width: 90,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: LocalizedText(
                title,
                style: AppTheme.greySubtitleStyle
                    .copyWith(color: AppTheme.textBlack),
                maxLines: 4,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: double.maxFinite,
              constraints: BoxConstraints(maxHeight: 60),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                color: AppTheme.white,
              ),
              child: Align(alignment: Alignment.center, child: bottom),
            ),
          ],
        ),
      ),
    );
  }
}
