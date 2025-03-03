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
          title: Text("Todo App with Cloud Firestore"),
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
                  // ElevatedButton( child:Text("Delete"),
                  //   onPressed: (){_dbService.delete();},
                  // ),
                  ElevatedButton( child:Text("ShowList"),
                    onPressed: (){_dbService.showList();},
                  ),

                  const SizedBox(height: 10),
                  const Text("User List", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(
                    height: 500,color: Colors.black12,
                    child: Expanded(
                      child: FutureBuilder<List<Map<String, dynamic>>>(
                        future: _dbService.showList(), // Fetch user list
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text("Error: ${snapshot.error}"));
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text("No users found."));
                          }

                          final users = snapshot.data!;
                          return ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];
                              return Card(
                                child: ListTile(
                                  title: Text(user["name"] ?? "No Name"),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Email: ${user["email"] ?? "No Email"}"),
                                      Text("Phone: ${user["phone"] ?? "No Phone"}"),
                                      Text("ID: ${user["id"]}"),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      _dbService.delete(user["id"]);
                                      setState(() {}); // Refresh UI after delete
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  )



                ],
              ),
            ),
          ),
        )
    );
  }
}
