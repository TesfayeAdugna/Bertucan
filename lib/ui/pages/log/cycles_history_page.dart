import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/single_cycle_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CyclesHistoryPage extends StatelessWidget {
  CyclesHistoryPage({Key? key}) : super(key: key);
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
                Center(
                  child: LocalizedText(
                    "back",
                    style: AppTheme.hintTextStyle.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return SingleCycleItem(
                      data: homeController.predictedDates[index]);
                }),
                itemCount: homeController.predictedDates.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
