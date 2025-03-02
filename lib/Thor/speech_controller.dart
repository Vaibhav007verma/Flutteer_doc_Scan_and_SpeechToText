import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import 'emp_model.dart';

class SpeechController extends GetxController{

  // final TextEditingController nameController = TextEditingController();
  SpeechToText speechToText = SpeechToText();
  RxString words = "".obs;
  RxBool enable = false.obs;
  RxBool isListening = false.obs;


  @override
  void onInit(){
    super.onInit();
    askAudio();
  }

  void askAudio() async {
    var per = await Permission.microphone.request();
    if(per.isDenied) {
      await Permission.microphone.request();
    }
    else if (per.isGranted) {
      enable.value = await speechToText.initialize();
    }
    else if (per.isPermanentlyDenied) {
      openAppSettings();
    }
  }



  void _result(SpeechRecognitionResult result) {
    words.value = result.recognizedWords;
    // nameController.text = words.value;
  }


  void startListen() async {
    await speechToText.listen(
        onResult: _result,
        listenFor: Duration(seconds: 10),
        pauseFor: Duration(seconds: 10)
    );
    isListening.value = true;
    // nameController.text = words.value;
  }

  void stopListen() async {
    await speechToText.stop();
    isListening.value = false;
    // nameController.text = "";
    words.value = "";
  }

//    Todo app methods

  var _emp = <Emp>[].obs;

  List<Emp> get emp => _emp;


  void add(String title, int id, bool isDone){
    debugPrint(words.value);
    emp.add(Emp(name: title,id: id, done: isDone ));
    stopListen();
  }

  void remove(int index){
    emp.removeAt(index);
  }

  void toggle(int index){
    emp[index] = Emp(name: emp[index].name, id: emp[index].id, done: !emp[index].done);
  }


}