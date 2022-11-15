import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;
  const NotificationTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AppTheme.subtlePink.withOpacity(0.2),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/badge.png",
            height: 40,
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: AppTheme.titleStyle4.copyWith(fontSize: 14)),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    subtitle,
                    style: AppTheme.titleStyle4.copyWith(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.srhDetailPage);
                    },
                    child: LocalizedText(
                      "take_a_look",
                      style: AppTheme.greySubtitleStyle
                          .copyWith(color: AppTheme.primaryColor),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
