import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/srh_controller.dart';
import 'package:bertucanfrontend/ui/widgets/image_holder.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SrhDetailPage extends StatelessWidget {
  SrhDetailPage({Key? key}) : super(key: key);
  SrhController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 10),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  margin: const EdgeInsets.all(10),
                                  color: AppTheme.primaryColor,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      LocalizedText(
                                          controller.selectedSrh.value.title ??
                                              "",
                                          style: AppTheme.titleStyle4
                                              .copyWith(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        Row(
                          children: [
                            ImageHolder(
                              path: controller.selectedSrh.value.icon,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //     "${controller.selectedSrh.value.user?.first_name ?? ""} ${controller.selectedSrh.value.user?.last_name ?? ""}",
                                //     style: AppTheme.titleStyle2),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Align(
                        //     alignment: Alignment.topLeft,
                        //     child: const Text(
                        //       'Posted 8 days ago',
                        //       style: AppTheme.articleTextStyle,
                        //       textAlign: TextAlign.left,
                        //     )),
                        // const SizedBox(height: 20),
                        Container(
                          child: Text(
                            controller.selectedSrh.value.body ?? "",
                            style: AppTheme.articleTextStyle,
                            textAlign: TextAlign.left,
                            // maxLines: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
