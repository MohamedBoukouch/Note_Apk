import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_apk/View/homeview.dart';
import 'package:notes_apk/config/constante.dart';
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
      backgroundColor: const Color.fromARGB(255, 64, 59, 59),
      appBar: AppBar(
        actions: [
          Icon(Icons.star),
          Icon(Icons.delete),
          Icon(Icons.save),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          int response = await sqlDb.insertData(
              '''INSERT INTO 'notes' ('titel','note') VALUES ('${titel.text}','${note.text}')
          ''');
          if (response > 0) {
            Get.off(HomeView());
          }
        },
        label: Text('Save'.toUpperCase()),
        icon: Icon(Icons.save_alt_sharp),
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                          decoration: const InputDecoration.collapsed(
                              hintText: "Titel",
                              hintStyle: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 168, 162, 162),
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          decoration: const InputDecoration.collapsed(
                              hintText: "Start typing ...",
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 168, 162, 162),
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
