import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screen/screen_layout.dart';

class VerifyCode extends StatefulWidget {
  final String verificationId;
  const VerifyCode({super.key, required this.verificationId});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final verifyCodeController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: verifyCodeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: '6 digit code'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  loading = true;
                });
                final credenial = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verifyCodeController.text.toString());

                try {
                  auth.signInWithCredential(credenial);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenLayout()));
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  e.toString();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    "Verify",
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
