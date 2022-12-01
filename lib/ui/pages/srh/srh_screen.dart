import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/gbv_tile.dart';
import 'package:bertucanfrontend/ui/components/srh_title.dart';
import 'package:bertucanfrontend/ui/controllers/srh_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_loader.dart';
import 'package:bertucanfrontend/ui/widgets/empty_data.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/no_data.dart';
import 'package:bertucanfrontend/ui/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SrhScreen extends StatefulWidget {
  SrhScreen({Key? key}) : super(key: key);

  @override
  State<SrhScreen> createState() => _SrhScreenState();
}

class _SrhScreenState extends State<SrhScreen> {
  SrhController controller = Get.find();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    controller.getSrhs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 41, 40),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const LocalizedText("srh_articles", style: AppTheme.titleStyle2),
            const SizedBox(height: 10),
            SearchTextField(
              hintText: 'search_article',
              controller: searchController,
              onChanged: (value) {
                controller.searchSrhByName(value);
              },
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.status.value.isLoading) {
                return const CustomLoader();
              } else if (controller.status.value.isSuccess) {
                if (controller.srhToShow.isEmpty) {
                  return const EmptyData();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.srhToShow.length,
                      itemBuilder: (context, index) => SrhTitle(
                        srh: controller.srhToShow[index],
                        name: controller.srhToShow[index].title ?? "",
                        description:
                            controller.srhToShow[index].small_description ?? "",
                        onTap: () {
                          controller.selectSrh(controller.srhToShow[index]);
                        },
                        imageUrl: controller.srhToShow[index].icon,
                      ),
                    ),
                  );
                }
              } else {
                return const NoData();
              }
            })
          ],
        ),
      ),
    );
  }
}
