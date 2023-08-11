
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screen/verify_code.dart';


class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final phoneNumberController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:20 ),
        child: Column(
          children: [
            SizedBox(height: 50,),
      
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '+1 234 4688 464'
              ),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
                  onTap: (){
                    setState(() {
                      loading = true;
                    });
                    auth.verifyPhoneNumber(
                      phoneNumber: "+91 ${phoneNumberController.text}",
                      verificationCompleted: (_){
                        setState(() {
                      loading = false;
                    });
                      }, 
                      verificationFailed: (e) {
                        setState(() {
                          loading = false;
                        });
                        e.toString();
                      }, 
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (context) => VerifyCode(verificationId: verificationId))  
                        );
                        setState(() {
                          loading = false;
                        });
                      }, 
                      codeAutoRetrievalTimeout: (e) {
                        e.toString();
                        setState(() {
                          loading = false;
                        });
                      });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}