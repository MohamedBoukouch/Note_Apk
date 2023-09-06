import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddnoteCader extends StatefulWidget {
  const AddnoteCader({super.key});

  @override
  State<AddnoteCader> createState() => _AddnoteCaderState();
}

class _AddnoteCaderState extends State<AddnoteCader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
        height: 110,
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(239, 179, 173, 173), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Material(
          color: Theme.of(context).brightness == Brightness.light
              ? Color.fromARGB(151, 255, 255, 255)
              : Colors.grey[700]!,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Add new note',
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
    ;
  }
}
