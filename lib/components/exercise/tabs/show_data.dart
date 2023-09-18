import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/data/provider.dart';
import 'package:provider/provider.dart';
// import '../provider_select_muscles.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // final selected = Provider.of<SelectMusclesProvider>(context);
    final tile = Provider.of<PrimaryMuscleProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          centerTitle: true,
          title: Text(
            "showdata",
            style: TextStyle(color: Colors.grey.shade400),
          ),
        ),
        body:
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("exercises")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection(tile.temp.toString())
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection(tile.title.toString())
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Text("No Data found");
                }

                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Reps: ${snapshot.data!.docs[index]['field1']}'),
                            Text('Reps: ${snapshot.data!.docs[index]['field2']}'),
                            const Text("e1RM:")
                          ],
                        ));
                      });
                }
                return Container();
              },
            ),
            
              );
  }
}
