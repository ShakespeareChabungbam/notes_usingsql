import 'package:flutter/material.dart';

import '../db/database_provider.dart';
import '../model/note_model.dart';




class ShowNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
          child: Text(
            'Your Notes',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.all(0),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
              IconButton(
                onPressed: () {
                  DatabaseProvider.db.deleteNote(note.id);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                icon: Icon(Icons.delete,color: Colors.white,),
              ),
        ],
      ),


      body: ListView(
          children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Card(
                  color: Colors.amber,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        note.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: double.infinity,
                  child: Text(
                    note.body,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}


