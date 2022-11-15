import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/gbv_controller.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GbvDetailPage extends StatelessWidget {
  const GbvDetailPage({Key? key}) : super(key: key);
  GbvController get gbvController => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: SingleChildScrollView(
        child: Padding(
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
                      child: LocalizedText("back",
                          style:
                              AppTheme.hintTextStyle.copyWith(fontSize: 20))),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.all(10),
                      color: AppTheme.primaryColor,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(gbvController.selectedGbv.name ?? "",
                              style: AppTheme.titleStyle4
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        gbvController.selectedGbv.phone_number ?? "",
                        style: AppTheme.titleStyle
                            .copyWith(color: AppTheme.textBlack),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        gbvController.selectedGbv.description ?? "",
                        textAlign: TextAlign.center,
                        maxLines: 5,
                        style: AppTheme.articleTextStyle,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                        ),
                        RoundedButton(
                            text: 'view_location',
                            onPressed: () async {
                              Get.toNamed(Routes.gbvLocationPage);
                            }),
                        const SizedBox(height: 40),
                        RoundedButton(
                            text: 'report_abuse',
                            onPressed: () {
                              Get.toNamed(Routes.reportGbvPage);
                            }),
                      ],
                    ),
                  ],
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
