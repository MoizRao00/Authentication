import 'package:authentication/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signup()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    Get.offAll(Wrapper());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        centerTitle: true,
      ),body: Column(
      children: [
        Text("Signup"),
        TextField(
          controller: emailController,
          decoration: InputDecoration(hintText: "Email"),
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(hintText: "Password"),
        ),
        SizedBox(),
        ElevatedButton(onPressed: () {signup();

        }, child: Text("Sign up")),
      ],
    ),
    );
  }
}
