import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // add user to our database
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set({'email': email, 'uid': cred.user!.uid});
        res = 'success';
      }
    } on FirebaseAuthException catch (e) {
      res = e.code;
    }
    return res;
  }

  // login with gmail and passsward

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "some error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      }
      res = "success";
    } on FirebaseAuthException catch (e) {
      res = e.code;
    }
    return res;
  }

  // Google sign in
  signInWithGoogle() async {
    //begin interactive signin process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
    //print(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
