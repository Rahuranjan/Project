import 'package:flutter/material.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  final TextEditingController name = TextEditingController();

  List<String> selectedDays = [];

  List<String> workoutDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "New Workout",
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
                style: TextStyle(color: Colors.yellow, fontSize: 18),
              )),
            )),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.yellow, fontSize: 18),
              ))
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: name,
              decoration: InputDecoration(
                  hintText: "Workout Name",
                  fillColor: Colors.grey.shade400,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900))),
              cursorColor: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: "Description (Optional)",
                  fillColor: Colors.grey.shade400,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900))),
              // cursorColor: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,),
              child: Text(
                "Select Workout Days",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: workoutDays.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          workoutDays[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: Checkbox(
                            checkColor: Colors.yellow,
                            activeColor: Colors.black,
                            value: selectedDays.contains(workoutDays[index]), 
                            onChanged: (value) {
                              setState(() {
                                if (value!) {
                                  selectedDays.add(workoutDays[index]);
                                } else {
                                  selectedDays.remove(workoutDays[index]);
                                }
                              });
                            }),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
