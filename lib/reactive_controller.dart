import 'package:get/get.dart';

class reactiveController extends GetxController{
  var name = ''.obs;

  void changeName(String newName){
    name.value = newName;
  }
}