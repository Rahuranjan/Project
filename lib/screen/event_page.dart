import 'package:flutter/material.dart';
import 'package:project/screen/exercises.dart';
import 'package:project/screen/workouts.dart';

class EventPage extends StatelessWidget {
  final DateTime date;
  const EventPage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'date',
          style: TextStyle(color: Colors.white),
        ),
        leading: Row(
          children: [
            IconButton(
              padding: const EdgeInsets.all(5),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
              color: Colors.yellow,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context){
                    return SizedBox(
                      height: 200,
                      child: ListView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ExerciseScreen()));
                                }, child: const Text("Choose Exercise", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),)),
                                const Divider(thickness: 1, color: Colors.black ,),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Workouts()));
                                }, child: const Text("Choose Workout", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),)),
                              ],
                            ),
                          ),
                          const SizedBox( height: 20,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),)),
                          ),
                        ],
                      ),
                    );
                  });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.yellow,
              ))
        ],
      ),
      body: const Center(
        child: Text('No Logs Found'),
      ),
    );
  }
}
