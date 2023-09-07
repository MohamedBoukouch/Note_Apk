import 'package:notes_apk/themes/dark_theme.dart';
import 'package:notes_apk/themes/light_theme.dart';

class AppFunction {
  AppFunction._();

  static handleSearch(String value, Function setState, bool isSearchEmpty) {
    if (value.isNotEmpty) {
      setState(() {
        isSearchEmpty = false;
      });
    } else {
      setState(() {
        isSearchEmpty = true;
      });
    }
  }

// static Local
  
}
