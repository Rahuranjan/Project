// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:project/data/provider.dart';
// import 'package:provider/provider.dart';
// import '../provider_select_muscles.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  User? userId = FirebaseAuth.instance.currentUser;

  List<List<String>> dataList = [];
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
  
  
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: ListView(
        children: [ 
          ExpansionPanelList.radio(
            children: _data.map<ExpansionPanelRadio>((Item item) {
              return ExpansionPanelRadio(
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
                    return ListTile(
                      title: Text(subMenuItem['name']),
                    );
                  }).toList(),
                ),  
              );
            }).toList()
          )
        ]
        // } ).toList()
      ),
      
    );
  }
  
  
  
  // @override
  // Widget build(BuildContext context) {
  //   // final selected = Provider.of<SelectMusclesProvider>(context);
  //   // final tile = Provider.of<PrimaryMuscleProvider>(context);
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.grey.shade900,
  //       centerTitle: true,
  //       title: Text(
  //         "showdata",
  //         style: TextStyle(color: Colors.grey.shade400),
  //       ),
  //     ),
  //     body: StreamBuilder(
  //       stream: FirebaseFirestore.instance
  //           .collection("exercises")
  //           .snapshots(),
  //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //         if (snapshot.hasError) {
  //           return const Text("something went wrong");
  //         }
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(
  //             child: CupertinoActivityIndicator(),
  //           );
  //         }
  //         if (snapshot.data!.docs.isEmpty) {
  //           return const Text("No Data found");
  //         }

  
}

class Item {
  Item(this.categoryName, this.subMenuItems);
  final String categoryName;
  final List<DocumentSnapshot> subMenuItems;
  bool isExpanded = false;
}

// import 'package:flutter/material.dart';


// // stores ExpansionPanel state information
// class Item {
//   Item({
//     required this.id,
//     required this.expandedValue,
//     required this.headerValue,
//   });

//   int id;
//   String expandedValue;
//   String headerValue;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       id: index,
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }

// class ShowData extends StatefulWidget {
//   const ShowData({super.key});

//   @override
//   State<ShowData> createState() =>
//       _ShowData();
// }

// class _ShowData
//     extends State<ShowData> {
//   final List<Item> _data = generateItems(8);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList.radio(
//       initialOpenPanelValue: 2,
//       children: _data.map<ExpansionPanelRadio>((Item item) {
//         return ExpansionPanelRadio(
//             value: item.id,
//             headerBuilder: (BuildContext context, bool isExpanded) {
//               return ListTile(
//                 title: Text(item.headerValue),
//               );
//             },
//             body: ListTile(
//                 title: Text(item.expandedValue),
//                 subtitle:
//                     const Text('To delete this panel, tap the trash can icon'),
//                 trailing: const Icon(Icons.delete),
//                 onTap: () {
//                   setState(() {
//                     _data
//                         .removeWhere((Item currentItem) => item == currentItem);
//                   });
//                 }));
//       }).toList(),
//     );
//   }
// }
