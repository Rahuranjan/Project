import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final DateTime date;
  const EventPage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('date', style: TextStyle(color: Colors.white),),
        leading: Row(
          children: [
            IconButton(
              padding: const EdgeInsets.all(5),
              onPressed:() =>Navigator.of(context).pop() , 
              icon: const Icon(Icons.arrow_back), 
              color: Colors.yellow,
            ),
            // const Text("Back", style: TextStyle(color: Colors.yellow),),
            
          ],
        ),
        actions: const [ Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.add, color: Colors.yellow,),
        )],
      ),
      body: const Center(
        child: Text('No Logs Found'),
      ),
    );
  }
}