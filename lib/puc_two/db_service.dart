
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thor/puc_two/user_model.dart';

class DatabaseService{
  final _fire = FirebaseFirestore.instance;



  create(User user) async{
    try{
      _fire.collection("users").add(user.toMap());
    }
    catch(e){
      print("Create Error:  ${e.toString()}");
    }
  }


  read() async {
    try{
      final data = await _fire.collection("users").get();
      final user = data.docs[0];
      print(user["name"]);
      print(user["age"].toString());
    } catch(e) {
      print("Read Error: ${e.toString()}");
    }
  }


  update() async {
    try{
      final data = await _fire.collection("users").doc("87xS0i1sUOMrjNVU977k").update({
        "name": "Tom", "age": 32, "Address": "California", "corr ect": false
      });
    } catch(e){
      print("Update Errro: ${e.toString()}");
    }
  }


  delete() async {
    try{
      await _fire.collection("users").doc("87xS0i1sUOMrjNVU977k").delete();
    } catch(e) {
      print("DELETE Error: ${e.toString()}");
    }
  }



  Future<List<Map<String,dynamic>>> showList() async {
    try{
      final snapshot = await _fire.collection("useres").get();
      return snapshot.docs.map((doc){
        return {
          "id": doc.id,
          ...doc.data(),
        };
      }).toList();
    }
    catch(e){
      print("ShowList Error: ${e.toString()}"); return [];
    }
  }


}