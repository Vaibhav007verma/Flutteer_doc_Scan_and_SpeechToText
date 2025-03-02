import 'package:flutter/material.dart';
import 'package:thor/puc_two/user_model.dart';

import 'db_service.dart';

class FirestoreTodo extends StatefulWidget {
  const FirestoreTodo({super.key});

  @override
  State<FirestoreTodo> createState() => _FirestoreTodoState();
}

class _FirestoreTodoState extends State<FirestoreTodo> {

  final _dbService = DatabaseService();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _phone.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Tifdsfdstle"),
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Firestore todo App',),SizedBox(height: 10,),
                  TextField(controller: _name,decoration: InputDecoration(label: Text("Name")),),SizedBox(height: 10,),
                  TextField(controller: _email,decoration: InputDecoration(label: Text("Email")),),SizedBox(height: 10,),
                  TextField(controller: _phone,decoration: InputDecoration(label: Text("Phone")),),SizedBox(height: 10,),
                  ElevatedButton( child:Text("Create"),
                    onPressed: (){
                      final user = User(name: _name.text, email: _email.text, phone: int.parse(_phone.text));
                      _dbService.create(user);
                    },
                  ),
                  ElevatedButton( child:Text("Read"),
                    onPressed: (){_dbService.read();},
                  ),
                  ElevatedButton( child:Text("Update"),
                    onPressed: (){_dbService.update();},
                  ),
                  ElevatedButton( child:Text("Delete"),
                    onPressed: (){_dbService.delete();},
                  ),
                  ElevatedButton( child:Text("ShowList"),
                    onPressed: (){_dbService.showList();},
                  ),



                ],
              ),
            ),
          ),
        )
    );
  }
}
