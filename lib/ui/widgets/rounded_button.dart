import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isEnabled;
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        decoration: AppTheme.primaryColoredRoundedButtonDecoration()
            .copyWith(color: isEnabled ? null : AppTheme.boxGrey),
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: LocalizedText(
          text,
          style: AppTheme.buttonLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
