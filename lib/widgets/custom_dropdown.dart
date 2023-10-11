import 'package:flutter/material.dart';
// import 'package:project/components/exercise/log.dart';
import 'package:project/data/data_model.dart';
// import 'package:project/data/provider.dart';
// import 'package:provider/provider.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<Menu> data = [];
  String? _expandedCategory;

  List<Item> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final categories = await FirebaseFirestore.instance.collection("Admin_exercises").get();
    final items = await Future.wait(categories.docs.map<Future<Item>>((category) async {
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

  void _handlePanelTapped(String category) {
    setState(() {
      if (_expandedCategory == category) {
        // If the tapped panel is already open, close it.
        _expandedCategory = null;
      } else {
        // Open the tapped panel.
        _expandedCategory = category;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: ListView(
        children: _data.map<Widget>((Item item) {
          return ExpansionPanelList.radio(
            children: [
              ExpansionPanelRadio(
                backgroundColor: Colors.black,
                canTapOnHeader: true,
                value: item.categoryName, 
                headerBuilder: (context, isExpanded){
                  return ListTile(
                    title: Text(item.categoryName),
                  );
                }, 
                body: Column(
                  children: item.subMenuItems.map((subMenuItem) {
                    // final desc = subMenuItem['desc']?.toString() ?? 'Description Not Available';
                    return ListTile(
                      title: Text(subMenuItem['name']),
                      // leading: Text("desc"),
                    );
                  }).toList(),
                ),  
              )
            ],
          );
        } ).toList()
      ),
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
  //         tile.updateString(list.name);
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => const Log()));
  //         print(tile.title);
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
  //     onExpansionChanged: (value) {
  //       tile.updateTemp(list.name);
  //       print(tile.temp);
  //     },
  //     title: Text(
  //       list.name,
  //       style: const TextStyle(color: Colors.white),
  //     ),
  //     children: list.subMenu.map(_buildlist).toList(),
  //     // children: list.subMenu.map((e) => _buildlist(e,)).toList(),
  //   );
  // }
}

class Item {
  Item(this.categoryName, this.subMenuItems);
  final String categoryName;
  final List<DocumentSnapshot> subMenuItems;
  bool isExpanded = false;
}
