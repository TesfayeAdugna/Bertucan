import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actionText = 'done',
    this.cancelText = 'cancel',
    this.actionCallback,
    this.contentTextAlign = TextAlign.center,
    this.secondAction,
    this.showCancel = true,
    this.secondActionCallback,
  }) : super(key: key);

  final String title;
  final String content;
  final String actionText;
  final String cancelText;
  final VoidCallback? actionCallback;
  final TextAlign contentTextAlign;

  final bool showCancel;
  final VoidCallback? secondActionCallback;
  final String? secondAction;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // insetPadding: const EdgeInsets.all(0),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTheme.titleStyle2,
      ),
      content: Text(
        content,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 14.0,
          letterSpacing: 1.2,
        ),
      ),
      actions: [
        if (showCancel)
          TextButton(
            child: LocalizedText(
              cancelText,
              style: AppTheme.normalTextStyle,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        if (actionCallback != null)
          TextButton(
            child: LocalizedText(actionText.tr, style: AppTheme.titleStyle4),
            onPressed: () {
              Get.back();
              actionCallback!();
            },
          ),
        if (secondAction != null)
          TextButton(
            child: LocalizedText(secondAction!, style: AppTheme.titleStyle4),
            onPressed: () {
              Get.back();
              if (secondActionCallback != null) secondActionCallback!();
            },
          ),
      ],
    );
  }
}
