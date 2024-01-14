import 'package:complete_ecommerce/src/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconly/iconly.dart';

class profilescreen extends StatelessWidget {
  const profilescreen({super.key});

  Future<void> logout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final FirebaseAuth auth = FirebaseAuth.instance;
    // ignore: unused_local_variable
    var currentUser = auth.currentUser;
    var photoUrl = currentUser?.photoURL ?? 'pictures/default_profile.png';
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(photoUrl))),
          ListTile(
            leading: Icon(
              IconlyLight.upload,
            ),
            title: Text('Upload image'),
            onTap: () {
              print('upload image');
            },
          ),
          ListTile(
            leading: Icon(
              IconlyLight.profile,
            ),
            title: Text('Profile'),
            onTap: () {
              print('profile');
            },
          ),
          ListTile(
            leading: Icon(
              IconlyLight.upload,
            ),
            title: Text('Upload image'),
            onTap: () {
              print('upload image');
            },
          ),
          ListTile(
            leading: Icon(
              IconlyLight.message,
            ),
            title: Text('message'),
            onTap: () {
              print('message');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share,
            ),
            title: Text('Share'),
            onTap: () {
              print('Share');
            },
          ),
          ListTile(
            leading: Icon(
              IconlyLight.setting,
            ),
            title: Text('setting'),
            onTap: () {
              print('settinge');
            },
          ),
          ListTile(
            leading: Icon(
              IconlyLight.logout,
            ),
            title: Text('logout'),
            onTap: () {
              logout();
              Get.to(loginscreen());
              print('logout');
            },
          ),
        ],
      ),
    );
  }
}
