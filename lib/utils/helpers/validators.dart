import 'package:bertucanfrontend/utils/functions.dart';
import 'package:get/get.dart';

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return translate("name_cannot_be_empty");
  }
  if (name.length < 3) {
    return translate("name_must_be_at_least_3_characters");
  }
  return null;
}
