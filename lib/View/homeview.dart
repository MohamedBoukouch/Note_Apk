import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_apk/View/addnote.dart';
import 'package:notes_apk/View/editnote.dart';
import 'package:notes_apk/config/constante.dart';
import 'package:notes_apk/service/sharedprefect.dart';
import 'package:notes_apk/shared/addnotecader.dart';
import 'package:notes_apk/shared/notes_cader.dart';
import 'package:notes_apk/sqldb.dart';
import 'package:notes_apk/themes/dark_theme.dart';
import 'package:notes_apk/themes/light_theme.dart';
import '../shared/search&favorit.dart';

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
  bool isloading = true;
  bool _icontheme = false;
  IconData _iconlight = Icons.wb_sunny;
  IconData _iconnight = Icons.nights_stay;
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
        // backgroundColor: _icontheme?LightTheme.colorScheme:Darktheme
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
            'Add note'.toUpperCase(),
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
                  top: AppConstant.screenHeight * .07, left: 20),
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: EdgeInsets.only(right: 20, top: 40),
                    height: AppConstant.screenHeight * .2,
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
                          child: Text('App Theme',
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
                              'Light theme',
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
                              'Dark theme',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
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
                child: const Text(
                  "Your Notes",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: AppConstant.heightBar * .4,
              ),
              Search_favorit(),
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
                      child: Container(
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
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.grey[700]!,
                            borderRadius: BorderRadius.circular(16),
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Stack(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${notes[i]['titel']}",
                                              style: TextStyle(
                                                  fontFamily: 'ZillaSlab',
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 20),
                                            )),
                                        Container(
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(bottom: 45),
                                          child: InkWell(
                                            onTap: () async {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                      title:
                                                          Text('Delete Note'),
                                                      content: Text(
                                                          'This note will be deleted permanently'),
                                                      actions: <Widget>[
                                                        InkWell(
                                                          onTap: () async {
                                                            int response =
                                                                await sqlDb
                                                                    .deletData(
                                                                        "DELETE FROM notes WHERE id=${notes[i]['id']}");
                                                            Navigator.pop(
                                                                context);
                                                            if (response > 0) {
                                                              notes.removeWhere(
                                                                  (element) =>
                                                                      element[
                                                                          'id'] ==
                                                                      notes[i][
                                                                          'id']);
                                                              setState(() {});
                                                            }
                                                          },
                                                          child: Container(
                                                            child: Text(
                                                                'DELETE',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red
                                                                        .shade300,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    letterSpacing:
                                                                        1)),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            child: Text(
                                                                'CANCEL',
                                                                style: TextStyle(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    letterSpacing:
                                                                        1)),
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
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    );
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
