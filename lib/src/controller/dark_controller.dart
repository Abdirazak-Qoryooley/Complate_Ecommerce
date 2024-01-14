



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class darkController extends GetxController{

  var isDark = false;

  void themechange(bool state){
    if(state == true){
      isDark =true;
      Get.changeTheme(ThemeData.light());

    }else{
      isDark =false;
      Get.changeTheme(ThemeData.dark());
   
    }
    update();
  }

}