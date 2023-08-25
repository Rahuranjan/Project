import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/resources/auth_method.dart';
import 'package:project/screen/login_screen.dart';
import 'package:project/widgets/text_box.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser;

  // edit field
  // Future<void> editField(String field) {

  // }

  void logout() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Column(
          children: [
            const Icon(
              Icons.person,
              color: Colors.grey,
              size: 100,
            ),
            TextBox(text: "My Account", icon: Icons.person_2, press: () {}),
            TextBox(text: "Setting", icon: Icons.settings, press: () {}),
            TextBox(
                text: "Notification", icon: Icons.notifications, press: () {}),
            TextBox(text: "My Account", icon: Icons.person_2, press: () {}),
            GestureDetector(
              onTap: () async {
                AuthMethods().signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: TextBox(text: "Logout", icon: Icons.logout, press: logout),
            ),
          ],
        ),
      ),
    );
  }
}
