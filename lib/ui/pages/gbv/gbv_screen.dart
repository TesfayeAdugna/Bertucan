import 'dart:developer';

import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/gbv_tile.dart';
import 'package:bertucanfrontend/ui/controllers/gbv_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_loader.dart';
import 'package:bertucanfrontend/ui/widgets/empty_data.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/no_data.dart';
import 'package:bertucanfrontend/ui/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GbvPage extends StatefulWidget {
  const GbvPage({Key? key}) : super(key: key);

  @override
  State<GbvPage> createState() => _GbvPageState();
}

class _GbvPageState extends State<GbvPage> {
  GbvController get gbvController => Get.find();
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    gbvController.getGbvies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const LocalizedText("gbv_title", style: AppTheme.titleStyle2),
            const SizedBox(height: 10),
            SearchTextField(
              hintText: 'search_gbv',
              controller: searchController,
              onChanged: (value) {
                gbvController.searchGbvByName(value);
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Container(
                    decoration: AppTheme.whiteBoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: LocalizedText('filiter_by_nearest',
                        style: AppTheme.normalPrimaryTextStyle)),
                onPressed: () {
                  gbvController.sortGbviesByLocation();
                },
              ),
            ),
            GetX<GbvController>(
              builder: (controller) {
                if (controller.status.isLoading) {
                  return const CustomLoader();
                } else if (controller.status.isSuccess) {
                  if (controller.gbviesToShow.isEmpty) {
                    return const EmptyData();
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.gbviesToShow.length,
                        itemBuilder: (context, index) => GbvTile(
                          gbv: controller.gbviesToShow[index],
                          onTap: () {
                            controller
                                .selectGbv(controller.gbviesToShow[index]);
                          },
                        ),
                      ),
                    );
                  }
                } else {
                  return const NoData();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
