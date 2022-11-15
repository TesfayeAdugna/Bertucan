import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final bool isActive;
  final bool isColorPrimary;
  const RectangularButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isActive = true,
    this.isColorPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onPressed : null,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: isColorPrimary || !isActive
            ? AppTheme.primaryColoredRectangularButtonDecoration()
            : AppTheme.nonPrimaryColoredRectangularButtonDecoration(),
        child: LocalizedText(
          label,
          style: AppTheme.buttonLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
