
import 'package:flutter/material.dart';

class Menu {
  late String name;
  List<Menu> subMenu = [];
  IconData? icon;

  Menu({ required this.name, required this.subMenu, required this.icon});

  Menu.fromJson(Map<String, dynamic> json){
    name = json['name'];
    icon = json['icon'];
    if(json['subMenu'] != null){
      subMenu.clear();
      json['subMenu'].forEach((v){
        subMenu.add(Menu.fromJson(v));
      });
    }
  }  
}

List datalist = [
  {
    "name": "sales",
    "subMenu": [
      {"name": "orders",
      "icons": Icons.bloodtype      
      },
      {"name": "Invoices",
       "icons": Icons.access_alarm,
      }
    ]
  },
  {
    "name": "Marketing",
    "subMenu": [    
          {"name": "catalog Price Rules",
           "icons": Icons.android_rounded
          },
          {"name": "Cart price Rules",
           "icons": Icons.wallet
          }
    ]
  },
  {
    "name": "Technology",
    "subMenu": [
      {"name": "Mobile",
       "icons": Icons.mobile_off
      },
      {"name": "Pc",
       "icons": Icons.place
      },
      {"name": "Laptop",
       "icons": Icons.laptop,
      }
    ]
  },
];