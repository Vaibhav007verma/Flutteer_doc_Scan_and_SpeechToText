import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ApiService extends GetxService{
  Future<String?> fetchData()async {
    await Future.delayed(Duration(seconds: 2),
            () {
                return "Hello World";
              }
    );
  }
}