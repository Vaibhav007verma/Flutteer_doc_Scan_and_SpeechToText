import 'package:flutter/material.dart';
import 'package:thor/Emp/emp.dart';
import 'package:thor/puc_one/speech.dart';
import 'package:get/get.dart';
import 'package:thor/puc_two/firestore_todo.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: EmpScr(),
      // home: Speech(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){Get.to(Speech());}, child: Text("PUC-I (Speech Todo)")),SizedBox(height: 20,),
              ElevatedButton(onPressed: (){Get.to(FirestoreTodo());}, child: Text("PUC-II (FireStore Todo)")),
            ],
          ),
        ),
      ),
    );
  }
}


