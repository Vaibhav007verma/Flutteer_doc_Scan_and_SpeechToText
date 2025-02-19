import 'package:flutter/material.dart';
import 'package:thor/Emp/emp.dart';
import 'package:thor/Thor/speech.dart';
import 'package:thor/counter_controller.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
  // Get.lazyPut<ApiService>(() => ApiService());
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
      // home: EmpScr(), // working fien with the getx todo App
      home: Speech(),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {

  final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text("Hello Title!"),),
      body: Column(
        children: [

          /*Obx(
            () => Text("Count value: ${controller.count}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))
          ),
          Text("Hello There"),
          ElevatedButton(onPressed: (){controller.decrement();}, child: Text("Decrement by One")),
          ElevatedButton(onPressed: (){Get.to(const NextPage());}, child: Text("Goto NextPage")),*/
        ],
      ),
     /* floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.increment();
          },
        child: Text("Tap to Increment Count"),
      ),*/
    );
  }
}

/*

class HomePg extends StatelessWidget {
  const HomePg({super.key});

  @override
  Widget build(BuildContext context) {

    final ApiService apiservice = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("GetX Dependency Injection")),
      body: Center(
        child: FutureBuilder<String>(
          future: apiService.fetchData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator(0;)
            } else if(snapshot.hasData){
              retrun Text(snapshot.data ?? 'No Data');
            } else {
              return const Text('Error in fetching Data');
            }
          }
        )
      )
    );
  }
}
*/



class NextPage extends StatelessWidget{
  const NextPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title:Text("Welcome to the Next Page")),
      body: Column(
        children: [
          Text("Hello"),
        ]
      )
    );
  }



}



/*class Name extends StatelessWidget{
  @override
  Widget build(BuildContext context)[
    final ReactiveController _controller = Get.put(ReactiveControoler());

    return Scaffold(
      appbar:AppBar(title:Text("this si to Change teh name")),
  body: Column(
  children;[
        Obx(
              () => Text('enterred name si ${_controller.name} ')
           ),
        TextField(onChanged:_controller.changeName, decoration:const InputDecoration(labelText:'Enter your Name:'))
      ]
  )
      )
  ]
}*/
