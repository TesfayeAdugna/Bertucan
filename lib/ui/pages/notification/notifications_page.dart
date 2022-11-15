import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/pages/notification/notification_tile.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.homePage);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                ),
                LocalizedText("notifications", style: AppTheme.titleStyle2),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: LocalizedText("new",
                style: AppTheme.buttonLabelStyle
                    .copyWith(color: AppTheme.textBlack)),
          ),
          Column(
            children: [
              NotificationTile(
                title: "Introducing Secret Chats Rules!",
                subtitle:
                    "Several guidelines to keep things safe and fun for everyone",
              ),
              NotificationTile(
                title: "Introducing Secret Chats Rules!",
                subtitle:
                    "Several guidelines to keep things safe and fun for everyone",
              )
            ],
          )
        ],
      ),
    );
  }
}
