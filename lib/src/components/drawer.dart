import 'package:complete_ecommerce/src/controller/dark_controller.dart';
import 'package:complete_ecommerce/src/controller/google.dart';
import 'package:complete_ecommerce/src/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconly/iconly.dart';

class drawer extends StatelessWidget {
  drawer({
    super.key,
  });
  final auth = FirebaseAuth.instance;

  Future<void> logout() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }
  final darkController controller2 = Get.put(darkController());

  final GoogleSignInController controller = Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    var currenuser = auth.currentUser;
    var photoUrl = currenuser?.photoURL ?? 'pictures/default_profile.png';
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(currenuser?.displayName ?? ""),
            accountEmail: Text(currenuser?.email ?? ""),
            currentAccountPicture: ClipOval(
              child: Image.network(photoUrl),
            ),
            decoration: BoxDecoration(color: Colors.purple),
          ),
          // ListTile(
          //   leading: Icon(
          //     IconlyLight.upload,
          //   ),
          //   title: Text('Upload image'),
          //   onTap: () {
          //     print('upload image');
          //   },
          // ),
        GetBuilder<darkController>(builder: (_)=>  ListTile(
            leading: Icon(
              Icons.sunny,
            ),
            title: Text('Night Mode'),
            trailing: Switch(
          // focusColor: Colors.grey,
          activeColor: Colors.white,
          activeTrackColor: Colors.grey,
          value: controller2.isDark,
          onChanged: (state){
            controller2.themechange(state);
          },
          

        ),
            onTap: () {
              print('profile');
            },
            
          ),),
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
