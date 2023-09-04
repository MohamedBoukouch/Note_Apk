import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_apk/View/addnote.dart';
import 'package:notes_apk/config/constante.dart';
import 'package:notes_apk/shared/addnotecader.dart';
import 'package:notes_apk/sqldb.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../shared/search&favorit.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Sqldb sqlDb = Sqldb();

  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("INSERT * FROM Notes");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 64, 59, 59),
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Get.to(Add_Note());
          },
          label: Text('Add note'.toUpperCase()),
          icon: Icon(Icons.add),
        ),
        endDrawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            
            Container(
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
                  GestureDetector(
                      onTap: () => Get.to(Add_Note()), child: AddnoteCader()),
                ],
              ),
            ),
          ],
        ));
  }
}
