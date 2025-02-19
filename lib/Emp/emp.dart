import 'package:flutter/material.dart';
import 'package:get/get.dart';


// Model

class Emp{
  String? name;
  int? id;
  bool done;

  Emp({this.name, this.id, this.done = false});
}



// Controller

class EmpControlelr extends GetxController {
  var emp = <Emp>[].obs;

  List<Emp> get _emp => emp;

  void add(String title, int id, bool isDone){
    _emp.add(Emp(name: title,id: id, done: isDone ));

  }

  void remove(int index){
    _emp.removeAt(index);
  }

  void toggle(int index){
    _emp[index] = Emp(name: _emp[index].name, id: _emp[index].id, done: !_emp[index].done);
  }

}

// UI


class EmpScr extends StatelessWidget{
  @override
  EmpScr({super.key});

  final TextEditingController _name = TextEditingController();
  final EmpControlelr _emp = Get.put(EmpControlelr());


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emp Screen")),
      body: Padding(padding: EdgeInsets.all(20.0), child: Column(
        children: [
          TextField(
            controller: _name,
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: (){
              _emp.add(_name.text, _emp._emp.length+1, _name.text.length < 3 ? true : false); _name.clear();
            },
          ),

          Container(
              height: 250, color: Colors.limeAccent,
              child: Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: _emp._emp.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(value: _emp._emp[index].done, onChanged: (val) => _emp.toggle(index)),
                      trailing: IconButton(icon: Icon(Icons.delete),onPressed: () => _emp.remove(index),),
                      title: Text(_emp._emp[index].name.toString()),
                      subtitle: Text(_emp._emp[index].done.toString()),
                    );
                  },
                )),
              )
          )
        ],
      ),)
    );
  }
}