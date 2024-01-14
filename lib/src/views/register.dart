import 'package:complete_ecommerce/src/constants.dart';
import 'package:complete_ecommerce/src/controller/PasswordController%20.dart';
import 'package:complete_ecommerce/src/controller/register.dart';
import 'package:complete_ecommerce/src/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class registerscreen extends StatelessWidget {
  registerscreen({super.key});
  void Function(bool?)? onChanged;
  final PasswordController _passwordController = Get.put(PasswordController());

  final RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Login Screen",
      //     style: TextStyle(fontWeight: FontWeight.w300),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: kPrimaryColor,
      //   elevation: 0,
      // ),

      // backgroundColor: Color(0xff069A9F3),
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'SIGN UP',
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
                      if (Value == null || Value.isEmpty) {
                        return 'please enter your email';
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
                  child: Obx(() => TextFormField(
              obscureText: !_passwordController.isPasswordVisible.value,
                    controller: controller.password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                     
                      prefixIcon: Icon(IconlyLight.password),
                      hintText: 'Enter your Password',
                      suffixIcon: IconButton(
                  icon: Icon(
                    _passwordController.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    _passwordController.togglePasswordVisibility();
                  },
                  
                ),
                    
                      border: InputBorder.none,
                      
                      hintStyle: TextStyle(
                        color: Colors.grey.shade300,
                      ),
                      
                    ),


                  ),)


                ),
                
             
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: kpadding),
                  decoration: BoxDecoration(color: Colors.purple.shade300),
                  child: Obx(() => TextFormField(
                    controller: controller.corfirm,
                    obscureText: _passwordController.isPasswordVisible.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your confirm';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(IconlyLight.password),
                      hintText: 'Enter your confrim',
                      border: InputBorder.none,
                      suffixIcon: IconButton(onPressed: (){
                          _passwordController.togglePasswordVisibility();
                      }, icon: Icon(_passwordController.isPasswordVisible.value?Icons.visibility:Icons.visibility_off)),
                      hintStyle: TextStyle(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),)
                ),
                SizedBox(
                  height: 25,
                ),
                Obx(
                  () => controller.isloading.value
                      ? CircularProgressIndicator()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              width: 370,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    controller.register();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(color: Colors.blue),
                                  ))),
                        ),
                ),
                SizedBox(
                  height: 50,
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
                        Get.to(loginscreen());
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
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
