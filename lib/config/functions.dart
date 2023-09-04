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
}
