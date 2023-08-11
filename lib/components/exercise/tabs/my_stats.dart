import 'package:flutter/material.dart';
import 'package:project/components/exercise/tabs/view_more_on_graphs.dart';

class MyStats extends StatefulWidget {
  const MyStats({super.key});

  @override
  State<MyStats> createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {
  final items = [
    'Max Weight Lifted',
    'Avg Weight Lifted',
    'Volume',
    'One Rep Max',
    'Maximumm Reps Completed',
    'Average Reps Completed'
  ];
  String? value = "Volume";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 325,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                      child: Text(
                    "Not enough data for graph",
                    style: TextStyle(color: Colors.grey.shade400),
                  )),
                  Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.black,
                          value: value,
                          icon: const Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(() {
                            this.value = value;
                          }),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewMore()));
                      },
                      child: const Text(
                        "View more on Graphs",
                        style: TextStyle(color: Colors.yellow, fontSize: 18),
                      ),
                    ),
                  )
                ],
              )),
          Container(
              color: Colors.black,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: const Text(
                "Statistics",
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Maxium Weight",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      Text(
                        "0 kg",
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Maxium Weight",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      Text(
                        "0 kg",
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Maxium Weight",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      Text(
                        "0 kg",
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Maxium Weight",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    Text(
                      "0 kg",
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Maxium Weight",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    Text(
                      "0 kg",
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
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
