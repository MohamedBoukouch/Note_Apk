import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_apk/View/homeview.dart';
import 'package:notes_apk/config/constante.dart';
import 'package:notes_apk/config/translations/app_translation.dart';
import 'package:notes_apk/sqldb.dart';

class Add_Note extends StatefulWidget {
  const Add_Note({super.key});

  @override
  State<Add_Note> createState() => _Add_NoteState();
}

class _Add_NoteState extends State<Add_Note> {
  Sqldb sqlDb = Sqldb();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController titel = TextEditingController();
  TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Color.fromARGB(255, 192, 191, 191)
          : Colors.grey[900]!,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color.fromARGB(255, 192, 191, 191)
            : Colors.grey[900]!,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.grey[600]!,
        onPressed: () async {
          int response = await sqlDb.insertData(
              '''INSERT INTO 'notes' ('titel','note') VALUES ('${titel.text}','${note.text}')
          ''');
          if (response > 0) {
            Get.offAll(HomeView(
              changeTheme: (Brightness brightness) {},
            ));
          }
        },
        label: Text(
          AppKeys.save_button.name.tr.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Color.fromARGB(255, 110, 108, 108)
                : Colors.white,
          ),
        ),
        icon: Icon(
          Icons.save_alt_sharp,
          color: Theme.of(context).brightness == Brightness.light
              ? Color.fromARGB(255, 110, 108, 108)
              : Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
                key: formstate,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: AppConstant.screenHeight * .05),
                      child: TextField(
                          controller: titel,
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 30),
                          decoration: InputDecoration.collapsed(
                              hintText: AppKeys.titel.name.tr,
                              hintStyle: TextStyle(
                                  fontSize: 30,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.white
                                      : Color.fromARGB(255, 168, 162, 162),
                                  fontWeight: FontWeight.bold))),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: AppConstant.screenHeight * .015),
                      child: TextField(
                          controller: note,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          decoration: InputDecoration.collapsed(
                              hintText: AppKeys.start_typing.name.tr,
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.white
                                      : Color.fromARGB(255, 168, 162, 162),
                                  fontWeight: FontWeight.bold))),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
