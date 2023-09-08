import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:notes_apk/View/homeview.dart';
import "package:notes_apk/View/loading.dart";
import "package:notes_apk/config/enums/app_enum.dart";
import "package:notes_apk/config/translations/app_translation.dart";
import "package:notes_apk/service/sharedprefect.dart";

import "package:notes_apk/themes/theme.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const APK_NOTE(),
  );
}

class APK_NOTE extends StatefulWidget {
  const APK_NOTE({super.key});

  @override
  State<APK_NOTE> createState() => _APK_NOTEState();
}

class _APK_NOTEState extends State<APK_NOTE> {
  ThemeData theme = appThemeLight;
  @override
  void initState() {
    super.initState();
    updateThemeFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: AppKeys.app_title.name.tr,
      theme: theme,
      // darkTheme: Darktheme,
      debugShowCheckedModeBanner: false,
      transitionDuration: Duration.zero,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.noTransition,
      translations: AppTranslation(),
      locale: Locale(LanguagesCode.en.name),
      fallbackLocale: Locale(LanguagesCode.en.name),
      home: HomeView(title: 'Home', changeTheme: setTheme),
    );
  }

  setTheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      setState(() {
        theme = appThemeDark;
      });
    } else {
      setState(() {
        theme = appThemeLight;
      });
    }
  }

  void updateThemeFromSharedPref() async {
    String? themeText = await getThemeFromSharedPref();
    if (themeText == 'light') {
      setTheme(Brightness.light);
    } else {
      setTheme(Brightness.dark);
    }
  }
}
