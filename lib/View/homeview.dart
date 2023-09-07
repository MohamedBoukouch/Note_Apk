import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_apk/View/addnote.dart';
import 'package:notes_apk/View/editnote.dart';
import 'package:notes_apk/config/constante.dart';
import 'package:notes_apk/config/enums/app_enum.dart';
import 'package:notes_apk/config/translations/app_translation.dart';
import 'package:notes_apk/service/sharedprefect.dart';
import 'package:notes_apk/shared/addnotecader.dart';
import 'package:notes_apk/sqldb.dart';

class HomeView extends StatefulWidget {
  final Function(Brightness brightness) changeTheme;
  final String? title;

  HomeView({Key? key, this.title, required this.changeTheme}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Sqldb sqlDb = Sqldb();
  late String selectedTheme;
  late String selectedLanguage = 'en';

  bool isloading = true;
  bool _langageSelected_fr = false;
  bool _langageSelected_en = false;
  bool _langageSelected_ar = false;
  List notes = [];

  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM notes");
    notes.addAll(response);
    isloading = false;
    if (this.mounted) {
      setState(() {});
    }
    return response;
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (Theme.of(context).brightness == Brightness.dark) {
        selectedTheme = 'dark';
      } else {
        selectedTheme = 'light';
      }
    });
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color.fromARGB(255, 192, 191, 191)
            : Colors.grey[900]!,
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Color.fromARGB(255, 192, 191, 191)
              : Colors.grey[900]!,
          iconTheme: IconThemeData(
              size: 35,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
          title: Container(
            margin: EdgeInsets.only(bottom: AppConstant.screenHeight * .045),
            alignment: Alignment.center,
            child: Image.asset("assets/titel.png",
                alignment: Alignment.center,
                width: AppConstant.screenHeight * .25,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.grey[600]!,
          onPressed: () {
            Get.to(Add_Note());
          },
          label: Text(
            AppKeys.add_button_2.name.tr.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Color.fromARGB(255, 110, 108, 108)
                  : Colors.white,
            ),
          ),
          icon: Icon(
            Icons.add,
            color: Theme.of(context).brightness == Brightness.light
                ? Color.fromARGB(255, 110, 108, 108)
                : Colors.white,
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Color.fromARGB(255, 192, 191, 191)
              : Colors.grey[900]!,
          child: ListView(
              padding: EdgeInsets.only(
                  top: AppConstant.screenHeight * .07, left: 20, right: 20),
              children: [
                Text(
                  AppKeys.Setting.name.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: EdgeInsets.only(right: 20, top: 40),
                    height: AppConstant.screenHeight * .23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).brightness == Brightness.light
                          ? Color.fromARGB(151, 255, 255, 255)
                          : Colors.grey[800]!,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10),
                          child: Text(AppKeys.App_theme.name.tr,
                              style: TextStyle(
                                  fontFamily: 'ZillaSlab', fontSize: 24)),
                        ),
                        Container(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 'light',
                              groupValue: selectedTheme,
                              onChanged: handleThemeSelection,
                            ),
                            Text(
                              AppKeys.light_theme.name.tr,
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 'dark',
                              groupValue: selectedTheme,
                              onChanged: handleThemeSelection,
                            ),
                            Text(
                              AppKeys.dark_theme.name.tr,
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(right: 20, top: 40),
                    height: AppConstant.screenHeight * .35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).brightness == Brightness.light
                          ? Color.fromARGB(151, 255, 255, 255)
                          : Colors.grey[800]!,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10),
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(AppKeys.language.name.tr,
                              style: TextStyle(
                                  fontFamily: 'ZillaSlab', fontSize: 24)),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.updateLocale(
                                        Locale(LanguagesCode.fr.name));
                                    _langageSelected_fr = !_langageSelected_fr;
                                    _langageSelected_en = false;
                                    _langageSelected_ar = false;
                                  },
                                  child: Container(
                                    height: AppConstant.screenHeight * .05,
                                    width: AppConstant.screenWidth,
                                    decoration: BoxDecoration(
                                        color: _langageSelected_fr == true
                                            ? Color.fromARGB(255, 4, 223, 121)
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        "Francais",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 19),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.updateLocale(
                                        Locale(LanguagesCode.en.name));
                                    _langageSelected_en = !_langageSelected_en;
                                    _langageSelected_fr = false;
                                    _langageSelected_ar = false;
                                  },
                                  child: Container(
                                    height: AppConstant.screenHeight * .05,
                                    width: AppConstant.screenWidth,
                                    decoration: BoxDecoration(
                                        color: _langageSelected_en == false
                                            ? Colors.transparent
                                            : Color.fromARGB(255, 4, 223, 121),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        "English",
                                        style: TextStyle(fontSize: 19),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.updateLocale(
                                        Locale(LanguagesCode.ar.name));
                                    _langageSelected_ar = !_langageSelected_ar;
                                    _langageSelected_fr = false;
                                    _langageSelected_en = false;
                                  },
                                  child: Container(
                                    height: AppConstant.screenHeight * .05,
                                    width: AppConstant.screenWidth,
                                    decoration: BoxDecoration(
                                        color: _langageSelected_ar == false
                                            ? Colors.transparent
                                            : Color.fromARGB(255, 4, 223, 121),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        "العربية",
                                        style: TextStyle(fontSize: 19),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    )),
              ]),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, left: 15),
                child: Text(
                  AppKeys.your_notes.name.tr,
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: AppConstant.heightBar * .4,
              ),
              SizedBox(
                height: AppConstant.screenHeight * .04,
              ),
              ListView.builder(
                  itemCount: notes.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return InkWell(
                        onTap: () {
                          Get.to(Editnote(
                              titel: notes[i]['titel'],
                              note: notes[i]['note'],
                              id: notes[i]['id']));
                        },
                        child: Stack(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                height: 110,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Color.fromARGB(239, 179, 173, 173)
                                          : Colors.grey[900]!,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Material(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.white
                                      : Colors.grey[800]!,
                                  borderRadius: BorderRadius.circular(16),
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${notes[i]['titel']}",
                                            style: TextStyle(
                                                fontFamily: 'ZillaSlab',
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 20),
                                          )),
                                    ),
                                  ),
                                )),
                            Positioned(
                              right: 10,
                              top: 7,
                              child: InkWell(
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          title: Text(AppKeys
                                              .titel_message_error.name.tr),
                                          content: Text(
                                              AppKeys.message_error.name.tr),
                                          actions: <Widget>[
                                            InkWell(
                                              onTap: () async {
                                                int response =
                                                    await sqlDb.deletData(
                                                        "DELETE FROM notes WHERE id=${notes[i]['id']}");
                                                Navigator.pop(context);
                                                if (response > 0) {
                                                  notes.removeWhere((element) =>
                                                      element['id'] ==
                                                      notes[i]['id']);
                                                  setState(() {});
                                                }
                                              },
                                              child: Container(
                                                child: Text(
                                                    AppKeys.delet.name.tr,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.red.shade300,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1)),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                child: Text(
                                                    AppKeys.cancel.name.tr,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1)),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ));
                  }),
              GestureDetector(
                  onTap: () => Get.to(Add_Note()), child: AddnoteCader()),
            ],
          ),
        ));
  }

  void handleThemeSelection(String? value) {
    setState(() {
      selectedTheme = value!;
    });
    if (value == 'light') {
      widget.changeTheme(Brightness.light);
    } else {
      widget.changeTheme(Brightness.dark);
    }
    setThemeinSharedPref(value!);
  }
}
