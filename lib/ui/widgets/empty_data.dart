import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LocalizedText("empty_data"),
    );
  }
}
