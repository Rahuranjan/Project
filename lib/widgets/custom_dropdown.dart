import 'package:flutter/material.dart';
import 'package:project/components/exercise/log.dart';

import '../data/dataModel.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<Menu> data = [];

  @override
  void initState() {
    for (var element in datalist) {
      data.add(Menu.fromJson(element));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => _buildlist(data[index],),
      ),
    );
  }

  Widget _buildlist(Menu list) {
    if (list.subMenu.isEmpty) {
      return ListTile(
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Log(title: list.name)));
        },
        title: Text(
          list.name,
          style: const TextStyle(color: Colors.white),
        ),
        leading: Icon(
          list.icon,
          color: Colors.red,
        ),
      );
    }
    return ExpansionTile(
      // leading: Icon(list.icon),
      title: Text(
        list.name,
        style: const TextStyle(color: Colors.white),
      ),
      children: list.subMenu.map(_buildlist).toList(),
      // children: list.subMenu.map((e) => _buildlist(e,)).toList(),
    );
  }
}
