// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/workouts/addworkout.dart';
// import 'package:project/components/workouts/provider_workoutdays.dart';
// import 'package:provider/provider.dart';

class Workouts extends StatefulWidget {
  const Workouts({super.key});

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    // final selectedWorkedDays = Provider.of<WorkoutDaysProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          "Workouts",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.yellow,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddWorkout()));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.yellow,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey.shade500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Program: PPL",
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("Workouts")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${snapshot.data!.docs[index]['Workout Name']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return SizedBox(
                                                    height: 270,
                                                    child: ListView(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const AddWorkout()));
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    "Edit",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontSize:
                                                                            18),
                                                                  )),
                                                              const Divider(
                                                                thickness: 1,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {},
                                                                  child:
                                                                      const Text(
                                                                    "Add to Program",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontSize:
                                                                            18),
                                                                  )),
                                                              const Divider(
                                                                thickness: 1,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "users")
                                                                        .doc(FirebaseAuth
                                                                            .instance
                                                                            .currentUser!
                                                                            .uid)
                                                                        .collection(
                                                                            "Workouts")
                                                                        .doc(
                                                                            "Dqg6pSglr1t7mVt5nvyD")
                                                                        .delete();
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    "Delete",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .red),
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                              child: const Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontSize:
                                                                        18),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: const Icon(Icons.more_vert))
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snapshot.data!.docs[index]['Description(Optional)']}'
                                                .isEmpty
                                            ? "No Desc"
                                            : '${snapshot.data!.docs[index]['Description(Optional)']}',
                                        textAlign: TextAlign.justify,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 300,
                                            height: 20,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    snapshot.data!.docs.length,
                                                itemBuilder: (context, index) =>
                                                     Text(
                                                      // "text, ",
                                                      "${snapshot.data!.docs[index]['Workout Days']}, ",
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    )),
                                          ),
                                          const Row(
                                            children: [
                                              Icon(Icons.fitness_center),
                                              Text(
                                                "3",
                                                style: TextStyle(
                                                    color: Colors.yellow),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return const Card();
                }),
          )
        ],
      ),
    );
  }
}
