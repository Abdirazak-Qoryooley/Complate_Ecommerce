// ignore_for_file: unused_local_variable, await_only_futures

import 'package:complete_ecommerce/src/constants.dart';
import 'package:complete_ecommerce/src/controller/login.dart';
import 'package:complete_ecommerce/src/views/home.dart';
import 'package:complete_ecommerce/src/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class loginscreen extends StatefulWidget {
  loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  void Function(bool?)? onChanged;

  final logincontroller controller = Get.put(logincontroller());
final auth1 = FirebaseAuth.instance;

Future<void> signInWithGoogle() async {
  // ignore: unused_local_variable
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Trigger the Google Authentication flow
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  // Obtain the Google Authentication credentials
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  // Create a new Firebase Auth credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  try {
    await FirebaseAuth.instance.signInWithCredential(credential);
    // Handle successful sign-in
  } catch (e, stackTrace) {
    print('Firebase Auth error: $e - $stackTrace');
  }
  // return userCredential;
}


  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    var currentUser = auth.currentUser;
    return Scaffold(
      //

      // backgroundColor: Color(0xff069A9F3),
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'Email',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: kpadding),
                  decoration: BoxDecoration(color: Colors.purple.shade300),
                  child: TextFormField(
                    controller: controller.email,
                    validator: (Value) {
                      if (Value!.isEmpty) {
                        return '   please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Enter your Email',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'Password',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: kpadding),
                  decoration: BoxDecoration(color: Colors.purple.shade300),
                  child: TextFormField(
                    controller: controller.password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '   please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(IconlyLight.password),
                      hintText: 'Enter your Password',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        checkColor: Colors.white,
                        onChanged: onChanged,
                      ),
                      Text('Remember me',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Obx(
                  () => controller.isloading.value
                      ? CircularProgressIndicator()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: 380,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!controller.isloading.value) {
                                  controller.login(success: () {});
                                } else {
                                  Get.to(home());
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Text(
                                'LOGIN',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: kpadding,
                ),
                Text('OR', style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: kpadding,
                ),
                Text(
                  'sign in with',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: kpadding,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await signInWithGoogle();
                      if (mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => home()),
                          (route) => false,
                        );
                      }
                    },
                    child: Image.asset('image/google.png'),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\t have an account?',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(registerscreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
