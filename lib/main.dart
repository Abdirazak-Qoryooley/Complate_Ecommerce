import 'package:complete_ecommerce/firebase_options.dart';
import 'package:complete_ecommerce/src/views/home.dart';
import 'package:complete_ecommerce/src/views/login.dart';
import 'package:complete_ecommerce/src/views/register.dart';
import 'package:complete_ecommerce/src/views/screens/cartpage.dart';
import 'package:complete_ecommerce/src/views/screens/favorite.dart';
import 'package:complete_ecommerce/src/views/screens/home.dart';
import 'package:complete_ecommerce/src/views/screens/profile.dart';
// import 'package:complete_ecommerce/src/views/screens/cartpage.dart';
// import 'package:complete_ecommerce/src/views/screens/favorite.dart';
// import 'package:complete_ecommerce/src/views/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginscreen(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => loginscreen(),
        ),
        GetPage(
          name: '/registerscreen',
          page: () => registerscreen(),
        ),
        GetPage(name: '/home', page: () => home()),
        GetPage(name: '/homescreeen', page: () => homescreen()),
        GetPage(name: '/cartpage', page: () => cartpage()),
        GetPage(name: '/FavoritePage', page: () => FavoritePage()),
        GetPage(name: '/profilescreen', page: () => profilescreen()),
        GetPage(name: '/cartpage', page: () => cartpage())
      ],
    );
  }
}
