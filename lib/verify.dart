import 'package:authentication/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  void initState() {
    sendverifylink();
    super.initState();

  }
  sendverifylink()async{
 final user = FirebaseAuth.instance.currentUser!;
 await user.sendEmailVerification().then((value)=> {
   Get.snackbar("Link sent", "Check your email",margin: EdgeInsets.all(30),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.grey)
 });
  }
  reload()async{
    await FirebaseAuth.instance.currentUser!.reload().then((value)=>{Get.offAll(Wrapper())});

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
        centerTitle: true,
      ),body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: (
              Text("Open your email and verify your account and Reload ths page")
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (()=>reload()),
      child: Icon(Icons.restart_alt_outlined),),

    );
  }
}
