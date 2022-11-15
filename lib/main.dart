import 'package:bertucanfrontend/shared/routes/app_pages.dart';
import 'package:bertucanfrontend/shared/translations/app_translation.dart';
import 'package:bertucanfrontend/ui/bindings/auth_binding.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: getInitialRoute(),
      initialBinding: AuthBinding(),
      translations: AppTranslation(),
      locale: getInitialLocale(),
    );
  }
}
