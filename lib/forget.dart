import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController emailController = TextEditingController();

reset()async{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,
      ),body: Column(
      children: [
        TextField(
        controller: emailController,
        decoration: InputDecoration(hintText: "Email"),
      ),
        SizedBox(),
        ElevatedButton(onPressed: () {reset();},
            child: Text("Send Link")),

      ],
    ),
    );
  }
}
