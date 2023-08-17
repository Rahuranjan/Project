import 'package:flutter/material.dart';
import 'package:project/components/exercise/add_exercise.dart';

import '../../data/dataModel.dart';

class PrimaryMuscle extends StatefulWidget {
  const PrimaryMuscle({super.key});

  @override
  State<PrimaryMuscle> createState() => _PrimaryMuscleState();
}

class _PrimaryMuscleState extends State<PrimaryMuscle> {
  List<Menu> data = [];
  String temp = "sales";

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
                    }
                  });
                  // Navigator.of(context).pop();
                  print(temp);
                  // print(selectedExercise);
                },
                title: Text(
                  data[index].name,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: temp == data[index].name ? const Icon(Icons.check, color: Colors.yellow,) : null ,
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddExercise(temp: temp)));
            },
            child:const Icon(Icons.arrow_forward_ios),
            ),
    );
  }
}
