import 'package:flutter/material.dart';
import 'package:project/components/workouts/provider_workoutdays.dart';
import 'package:provider/provider.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  final TextEditingController name = TextEditingController();

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
              decoration: const InputDecoration(
                hintText: "Workout Name",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Color.fromRGBO(189, 189, 189, 1),
                filled: true,
              ),
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
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
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
                      return Consumer<WorkoutDaysProvider>(
                        builder: (context, value, child) => ListTile(
                          onTap: () {
                            if (value.selectedDays.contains(workoutDays[index].toString())) { 
                              // value.removeDays(index.toString());
                              value.removeDays(workoutDays[index].toString());
                            } else {
                              // value.addDays(index.toString());
                              value.addDays(workoutDays[index].toString());
                            }
                            print(value.selectedDays);
                          },
                          title: Text(
                            workoutDays[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(
                            value.selectedDays.contains(workoutDays[index].toString())
                                ? Icons.check
                                : null,
                            color: Colors.yellow,
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
