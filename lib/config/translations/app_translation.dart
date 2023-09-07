// ignore_for_file: constant_identifier_names

import "package:get/get.dart";

import "../enums/app_enum.dart";
import "language_ar.dart";
import "language_en.dart";
import "language_fr.dart";

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return <String, Map<String, String>>{
      LanguagesCode.en.name: language_en,
      LanguagesCode.ar.name: language_ar,
      LanguagesCode.fr.name: language_fr,
    };
  }
}

enum AppKeys {
  app_title,
  Setting,
  App_theme,
  light_theme,
  dark_theme,
  language,
  your_notes,
  add_button_1,
  add_button_2,
  save_button,
  titel,
  start_typing,
  titel_message_error,
  message_error,
  cancel,
  delet,

}
