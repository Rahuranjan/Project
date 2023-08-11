import 'package:flutter/material.dart';

class ViewMore extends StatefulWidget {
  const ViewMore({super.key});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  final rangeitems = [
    'Past 7 days',
    'past month',
    'past 3 months',
    'past 6 months',
    'past year',
    'show all'
  ];
  final graphitems = [
    'Max Weight Lifted',
    'Avg Weight Lifted',
    'Volume',
    'One Rep Max',
    'Maximum Reps Completed',
    'Average Reps Completed'
  ];
  String? value1 = "Volume";
  String? value2 = "Past 7 days";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          "Crunch",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.yellow,
            )),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.black,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Select Graph:",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black,
                      value: value1,
                      items: graphitems.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() {
                        value1 = value;
                      }),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Select Range:",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black,
                      value: value2,
                      items: rangeitems.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() {
                        value2 = value;
                      }),
                    ),
                  ),
                )
              ],
            ),
            Text("No enough data to graph")
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(color: Colors.grey.shade400),
      ));
}
