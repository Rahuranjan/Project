import 'package:flutter/material.dart';
import 'package:project/components/exercise/log.dart';
import 'package:project/data/provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  List<Item> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final categories =
        await FirebaseFirestore.instance.collection("Admin_exercises").get();
    final items =
        await Future.wait(categories.docs.map<Future<Item>>((category) async {
      final subMenuCollection = category.reference.collection("subMenu");
      final subMenuItems = (await subMenuCollection.get()).docs.toList();
      return Item(
        category['name'],
        subMenuItems,
      );
    }).toList());

    setState(() {
      _data = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tile = Provider.of<PrimaryMuscleProvider>(context);
    return Expanded(
      child: ListView(children: [
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: ExpansionPanelList.radio(
              elevation: 0,
              expandedHeaderPadding: EdgeInsets.zero,
              children: _data.map<ExpansionPanelRadio>((Item item) {
                return ExpansionPanelRadio(
                  // In ExpansionPanelRadio widget I wanted to use property like onExpansionChanged and store the categoryName 
                  // like : ...
                  // onExpansionChanged: (value) {
                  //   tile.updateExerciseName(list.categoryName);
                  // },
                  // there is no property like onExpensionChanged for ExpansionPanelRadio
                  // if i am using GestureDetector to use ontap property on ListTile then cantapOnHeader property is not working.
                  backgroundColor: Colors.black,
                  canTapOnHeader: true,
                  value: item.categoryName,
                  headerBuilder: (context, isExpanded) {
                    return GestureDetector(
                      child: ListTile(
                        title: Text(item.categoryName),
                      ),
                    );
                  },
                  body: Column(
                    children: item.subMenuItems.map((subMenuItem) {
                      return ListTile(
                        onTap: () {
                          tile.updateSubMenuItem(subMenuItem['name']);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Log()));
                          // print(tile.subMenuItemName);
                        },
                        title: Text(subMenuItem['name']),
                      );
                    }).toList(),
                  ),
                );
              }).toList()),
        )
      ]),
    );
  }

  // @override
  // void initState() {
  //   for (var element in datalist) {
  //     data.add(Menu.fromJson(element));
  //   }
  //   super.initState();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Expanded(
  //     child: ListView.builder(
  //       itemCount: data.length,
  //       itemBuilder: (context, index) => _buildlist(
  //         data[index],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildlist(Menu list) {
  //   final tile = Provider.of<PrimaryMuscleProvider>(context);
  //   if (list.subMenu.isEmpty) {
  //     return ListTile(
  //       onTap: () {
  //         tile.updateSubMenuItem(list.subMenuItemName);
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => const Log()));
  //         print(tile.subMenuItemName);
  //       },
  //       title: Text(
  //         list.name,
  //         style: const TextStyle(color: Colors.white),
  //       ),
  //       leading: Icon(
  //         list.icon,
  //         color: Colors.red,
  //       ),
  //     );
  //   }
  //   return
  //   ExpansionTile(
  //      onExpansionChanged: (value) {
  //      tile.updateExerciseName(list.name);
  //      print(tile.exerciseName);
  //    },
  //     title: Text(
  //       list.name,
  //       style: const TextStyle(color: Colors.white),
  //     ),
  //     children: list.subMenu.map(_buildlist).toList(),
  //   );
  // }
}

class Item {
  Item(this.categoryName, this.subMenuItems);
  final String categoryName;
  final List<DocumentSnapshot> subMenuItems;
  bool isExpanded = false;
}
