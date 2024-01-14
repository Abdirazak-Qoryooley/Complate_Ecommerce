import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class logincontroller extends GetxController {
  // late String name;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;
  RxBool isloading = false.obs;

  get isLoggedIn => null; // Use an RxBool to observe changes

  void login({required Null Function() success}) async {
    try {
      isloading.value = true; // Update the value using .value
      // ignore: unused_local_variable
      var response = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      print('success');
    } catch (e) {
      print(e);
    }
    isloading.value = false; // Update the value using .value
  }


}
