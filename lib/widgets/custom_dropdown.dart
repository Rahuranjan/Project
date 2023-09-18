import 'package:flutter/material.dart';
import 'package:project/components/exercise/log.dart';
import 'package:project/data/data_model.dart';
import 'package:project/data/provider.dart';
import 'package:provider/provider.dart';

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
        itemBuilder: (context, index) => _buildlist(
          data[index],
        ),
      ),
    );
  }

  Widget _buildlist(Menu list) {
    final tile = Provider.of<PrimaryMuscleProvider>(context);
    if (list.subMenu.isEmpty) {
      return ListTile(
        onTap: () {
          tile.updateString(list.name);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Log()));
          print(tile.title);
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
      onExpansionChanged: (value) {
        tile.updateTemp(list.name);
        print(tile.temp);
      },
      title: Text(
        list.name,
        style: const TextStyle(color: Colors.white),
      ),
      children: list.subMenu.map(_buildlist).toList(),
      // children: list.subMenu.map((e) => _buildlist(e,)).toList(),
    );
  }
}
