import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'localized_text.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.onConfirm,
      this.onCancel})
      : super(key: key);
  String title;
  List<Widget> content;
  Function onConfirm;
  Function? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: LocalizedText(
        title,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ...content,
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child:
                      LocalizedText('cancel', style: AppTheme.normalTextStyle),
                  onPressed: () {
                    onCancel?.call();
                    Get.back();
                  },
                ),
                TextButton(
                  child: Container(
                      decoration:
                          AppTheme.primaryColoredRectangularButtonDecoration(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: LocalizedText('confirm',
                          style: AppTheme.normalTextStyle
                              .copyWith(color: Colors.white))),
                  onPressed: () {
                    onConfirm();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
