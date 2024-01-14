// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController corfirm = TextEditingController();
  final auth = FirebaseAuth.instance;
  var isloading = false.obs;

  void register() async {
    if (password.text != corfirm.text) {
      print("Passwords do not match.");
    } else {
      try {
        isloading.value = true;
        var response = await auth.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(response.user?.uid)
            .set({
          'email': email.text,
          'passowrd': password.text
          // Add more fields as needed
        });
        print('success');
      } catch (e) {
        print(e);
      }
      isloading.value = false;
    }
  }
}
