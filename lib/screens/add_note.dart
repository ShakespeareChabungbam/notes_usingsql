import 'package:flutter/material.dart';

import '../db/database_provider.dart';
import '../model/note_model.dart';


class AddNotes extends StatefulWidget {

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  //add note function
  String title='';
  String body='';
  DateTime date=DateTime.now();
  int id=0;
  var count=0;

  TextEditingController titleController=TextEditingController();
  TextEditingController idController=TextEditingController();
  TextEditingController bodyController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  

  addNote(NoteModel note){
    DatabaseProvider.db.addNewNotes(note);
    setState(() {
      count++;
    });
    print('note added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
        title: Text('Your Note',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              // TextField(
              //   controller: idController,
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: "S.NO",
              //   ),
              //   style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              // ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Title",
                ),
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2,color: Colors.pink,),
              Expanded(
                child: TextField(
                  controller: bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Colors.white),),
                    hintText: "description",
                    border: InputBorder.none
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
          onPressed: (){
            setState(() {
              title=titleController.text;
              body=bodyController.text;
              date=DateTime.now();
              id=DateTime.now().second ;
              count++;
            });
            NoteModel note =NoteModel(id: id, title: title, body: body, creation_date: date);
            addNote(note);
            print(count);

            Navigator.pushNamedAndRemoveUntil(context, "/",(route)=>false);
          },
          label: Text('Save Notes'),
          icon: Icon(Icons.save,color: Colors.black,),
      ),
    );
  }
}
