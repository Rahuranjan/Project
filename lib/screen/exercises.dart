import 'package:flutter/material.dart';
import 'package:project/components/exercise/add_exercise.dart';
import 'package:project/widgets/custom_dropdown.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});
  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Exercises",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: const Icon(
          Icons.settings,
          color: Colors.yellow,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddExercise()));
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.yellow,
                  )))
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade500),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const CustomDropdown()
          ],
        ),
      ),
    );
  }
}
