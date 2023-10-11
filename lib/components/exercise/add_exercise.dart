import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/exercise/muscles_worked.dart';
import 'package:project/components/exercise/primary_muscle.dart';
import 'package:project/components/exercise/provider_select_muscles.dart';
import 'package:project/components/exercise/tempdata.dart';
// import 'package:project/data/provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({
    super.key,
  });

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  final TextEditingController _exerciseNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _exerciseNameController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tempdata = Provider.of<TempData>(context);
    final selected = Provider.of<SelectMusclesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text(
          "New Exercise",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Center(
                  child: Text(
                "Cancel",
                style: TextStyle(color: Colors.yellow, fontSize: 16),
              )),
            )),
        actions: [
          TextButton(
              onPressed: () {
                String id = const Uuid().v1();
                FirebaseFirestore.instance
                    .collection("exercises")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection(tempdata.data.toString())
                    .doc(id)
                    .set({
                  "Exercise": tempdata.data,
                  "exercise name": _exerciseNameController.text,
                  "Description": _descriptionController.text,
                  "musclesWorked": selected.selectedMuscles
                });
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.yellow, fontSize: 18),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey.shade900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tempdata.data == null ? "abs" : tempdata.data!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PrimaryMuscle()));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey.shade900,
                child: TextField(
                  controller: _exerciseNameController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.grey.shade400),
                  decoration: InputDecoration(
                      hintText: "Exercise Name",
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      fillColor: Colors.grey.shade900,
                      filled: true),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container( 
                color: Colors.grey.shade900,
                child: TextField(
                  style: TextStyle(color: Colors.grey.shade400),
                  keyboardType: TextInputType.text,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      hintText: "Description (Optional)",
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      fillColor: Colors.grey.shade900,
                      filled: true),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.grey.shade900,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Other Muscles Worked",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MusclesWorked()));
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ))
                      ],
                    ),
                    Container(
                      width: 320,
                      height: 20,
                      // margin: const EdgeInsets.all(10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selected.selectedMuscles.length,
                        itemBuilder: (context, index) => Text(
                          "${selected.selectedMuscles[index]}, ", style: const TextStyle(
                            color: Colors.white
                          ),
                        )),
                    )
                  ],
                ),
                
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
