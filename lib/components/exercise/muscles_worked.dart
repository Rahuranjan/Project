import 'package:flutter/material.dart';
import 'package:project/components/exercise/provider_select_muscles.dart';
import 'package:provider/provider.dart';

class MusclesWorked extends StatefulWidget {
  const MusclesWorked({super.key});

  @override
  State<MusclesWorked> createState() => _MusclesWorkedState();
}

class _MusclesWorkedState extends State<MusclesWorked> {
  List<String> musclesWorked = [
    'Abs',
    'Back',
    'Biceps',
    'Calves',
    'Cardio',
    'Chest',
    'Forearms',
    'Glutes',
    'Legs',
    'Shoulders',
    'Triceps',
    'Aerobic',
    'Deltoids',
    'Hamstrings',
    'Lats',
    'Lower Back',
    'Obliques',
    'Quads',
    'Rhomboid',
    'Traps',
    'Hips',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text(
          "Select All That Apply",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Done",
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: musclesWorked.length,
          itemBuilder: (context, index) {
            return Consumer<SelectMusclesProvider>(
              builder: (context, value, child) => ListTile(
                onTap: () {
                  if (value.selectedMuscles.contains(musclesWorked[index])) {
                    value.removeMuscles(musclesWorked[index]);
                  } else {
                    value.addMuscles(musclesWorked[index]);
                  }
                  print(value.selectedMuscles);
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      musclesWorked[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
                trailing: Icon(
                  value.selectedMuscles.contains(musclesWorked[index])
                      ? Icons.check
                      : null,
                  color: Colors.yellow,
                ),
              ),
            );
          }),
    );
  }
}
