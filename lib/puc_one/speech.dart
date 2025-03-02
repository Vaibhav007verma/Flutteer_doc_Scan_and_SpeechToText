import 'package:flutter/material.dart';
import 'package:thor/puc_one/speech_controller.dart';
import 'package:get/get.dart';


class Speech extends StatefulWidget {
  const Speech({super.key});

  @override
  State<Speech> createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {
  late final SpeechController _speech;

  @override
  void initState() {
    super.initState();
    _speech = Get.put(SpeechController());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Speech To Text Todo App")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Text('Audio Permission ${_speech.enable.value ? "Enabled" : "Not Enabled"}')),
            Obx(() => ElevatedButton(
              onPressed: _speech.isListening.value ? _speech.stopListen : _speech.startListen,
              child: Text(_speech.isListening.value ? "Stop Listening" : "Tap to Start Listen or Add Text"),
            )),
            Obx(() => Text(_speech.words.value)),


            //   Todo APP UI

            Obx(() => Padding(padding: EdgeInsets.all(20.0), child: TextField(
              controller: TextEditingController(text: _speech.words.value),decoration: InputDecoration(hintText: "Enter some text"),
            ),)),

            IconButton(
              icon: Icon(Icons.add_comment_outlined,color: Colors.green,),
              onPressed: (){
                _speech.add(_speech.words.value, _speech.emp.length+1, _speech.words.value.length < 3 ? true : false);

              },
            ),

            Container(
              height: 350, color: Colors.black12,
              child: Obx(() => ListView.builder(
                itemCount: _speech.emp.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      activeColor: Colors.green,
                      value: _speech.emp[index].done,
                      onChanged: (val) => _speech.toggle(index),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Colors.red,),
                      onPressed: () => _speech.remove(index),
                    ),
                    title: Text(_speech.emp[index].name.toString(),style: TextStyle(decoration: _speech.emp[index].done ? TextDecoration.lineThrough : TextDecoration.none),),
                    subtitle: Text(_speech.emp[index].done.toString()),
                  );
                },
              )),
            )



          ],
        ),
      ),
    );
  }
}
