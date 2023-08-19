import 'package:flutter/material.dart';
import 'package:project/components/exercise/add_exercise.dart';
import 'package:project/components/exercise/tempdata.dart';

import '../../data/dataModel.dart';

class PrimaryMuscle extends StatefulWidget {
  const PrimaryMuscle({super.key});

  @override
  State<PrimaryMuscle> createState() => _PrimaryMuscleState();
}

class _PrimaryMuscleState extends State<PrimaryMuscle> {
  String temp = "sales";
  List<Menu> data = [];

  @override
  void initState() {
    super.initState();
    for (var element in datalist) {
      data.add(Menu.fromJson(element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text(
          "Select Primary Muscle",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: ListTile(
                onTap: () {
                  setState(() {
                    if (data[index].name != temp) {
                      temp = data[index].name;
                      TempData().updateString(data[index].name);
                    }
                  });
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AddExercise(temp: temp)));

                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AddExercise(temp: temp)),
                  //     (route) => false);
                  Navigator.of(context).pop();
                  print(temp);
                  // print(selectedExercise);
                },
                title: Text(
                  data[index].name,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: temp == data[index].name
                    ? const Icon(
                        Icons.check,
                        color: Colors.yellow,
                      )
                    : null,
              ),
            );
          }),
    );
  }
}
