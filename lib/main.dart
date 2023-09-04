import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:notes_apk/View/homeview.dart';
import "package:notes_apk/View/loading.dart";


void main() async {
  runApp(
    const APK_NOTE(),
  );
}

class APK_NOTE extends StatelessWidget {
  const APK_NOTE({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: AppKeys.app_title.name.tr,
      // theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      transitionDuration: Duration.zero,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.noTransition,
      // translations: AppTranslation(),
      // locale: Locale(LanguagesCode.fr.name),
      // fallbackLocale: Locale(LanguagesCode.fr.name),
      home:  LoadingView(),
    );
  }
}
