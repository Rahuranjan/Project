import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: Text("showdata", style: TextStyle(color: Colors.grey.shade400),),
      ),
      body: Container(
        color: Colors.black,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return const Text("something went wrong");
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center( child: CupertinoActivityIndicator(),);
            }
            if(snapshot.data!.docs.isEmpty){
              return const Text("No Data found");
            }

            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  return const Card(
                    child: ListTile(
                      title: Text("data"),
                    ),
                  );
                }
                );
            }
            return Container();
          },
          ),
      ),
    );
  }
}