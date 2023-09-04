import 'package:flutter/material.dart';

class NotesCader extends StatelessWidget {
  final String? titel;
  final String? note;
   NotesCader({
    super.key,
    this.titel,
    this.note,
    required String title,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Material(
          color: Color.fromARGB(0, 64, 59, 59),
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            titel!,
                            style: TextStyle(
                                fontFamily: 'ZillaSlab',
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            note!,
                            style: TextStyle(
                                fontFamily: 'ZillaSlab',
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
    
  }
}
