
import 'package:flutter/material.dart';

class Menu {
  late String name;
  List<Menu> subMenu = [];
  IconData? icon;
  String? desc;

  Menu({ required this.name, required this.subMenu, required this.icon, required this.desc});

  Menu.fromJson(Map<String, dynamic> json){
    name = json['name'];
    icon = json['icon'];
    desc = json['desc'];
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
    "name": "Abs", 
    "subMenu": [
      {"name": "Ab Rollout",
      "icons": Icons.bloodtype ,
      "desc": "abs ka ho"     
      },
      {"name": "Air Bike",
       "icons": Icons.access_alarm,
      },
      {
        "name": "Crunch",
        "icons": Icons.ac_unit,
      },
      {
        "name": "Crunch(Ball)",
        "icons": Icons.abc
      },
      {
        "name": "Crunch(Cross Body)"
      },
      {
        "name": "Crunch(Decline)"
      },
      {
        "name": "Decline Oblique Crunch"
      },
      {
        "name": "Internal Rotation"
      },
      {
        "name": "Leg Raise"
      },
      {
        "name": "Plank"
      },
      {
        "name": "Side Bend(Dumbbell)"
      },
      {
        "name": "Side Crunch(Ball)"
      },
      {
        "name": "Side Plank"
      },
      {
        "name": "Side Plank Oblique"
      },
      {
        "name": "sit-Up"
      },
      {
        "name": "Superman"
      }
    ]
  },
  {
    "name": "Back",
    "subMenu": [    
          {"name": "Bent Arm Pull-Over(Dumbbell)",
           "icons": Icons.android_rounded
          },
          {"name": "Bent-Over Row",  
           "icons": Icons.wallet
          },
          {
            "name": "Chin-Up"
          },
          {
            "name": "Deadlift(Barbell)"
          },
          {
            "name": "Deadlift(Barbell)"
          },
          {
            "name": "deadlift(Smith)"
          },
          {
            "name": "Good-Morning"
          },
          {
            "name": "Good-Morning(Smith)"
          },
          {
            "name": "Hyperextension",
          },
          {
            "name": "Inverted Row",
          },
          {
            "name": "Lat Pulldown"
          },
          {
            "name": "Lat Pulldown(Close Grip)"
          },
          {
            "name": "Lat Pulldown(Reverse Grip)"
          },
          {
            "name": "Lat Pulldown(V-Bar)"
          },
          {
            "name": "Pull-Up",
            
          },
          {
            "name": "Pull-Up(V-Bar)"
          },
          {
            "name": "Pullover(Dumbbell)"
          },
          {
            "name": "Push-Down(Straignt Arm)"
          },
          {
            "name": "Seated Row(Cable)"
          },
          {
            "name": "Side to Side Pull-Up"
          },
          {
            "name": "T-bar Row"
          }
    ]
  },
  {
    "name": "Biceps",
    "subMenu": [
      {"name": "Biceps",
       "icons": Icons.mobile_off
      },
      {"name": "Curl(Barbell)",
       "icons": Icons.place
      },
      {"name": "Curl(Cable)",
       "icons": Icons.laptop,
      },
      {
        "name": "Curl(Dumbbell)"
      },
      {
        "name": "Curl(EZ-Bar)"
      },
      {
        "name": "Curl(Machine)"
      },
      {
        "name": "Drag Crul"
      },
      {
        "name": "Hammer Curl"
      },
      {
        "name": "Hammer Curl(Alternate)"
      },
      {
        "name": "Hammer Curl(Cable)"
      },
      {
        "name": "High Cable Curl"
      },
      {
        "name": "Lying Incline Curl(Barbell)"
      },
      {
        "name": "Lying Incline Curl(Dumbbell)"
      },
      {
        "name": "One Legged Bicep Curl"
      },
      {
        "name": "Preacher Curl(Barbell)"
      },
      {
        "name": "Preacher Curl(Cable)"
      },
      {
        "name": "Preacher Curl(Dumbbell)"
      },
      {
        "name": "Reverse Curl"
      },
      {
        "name": "Spider Curl"
      }
    ]
  },
  {
    "name": "Calves",
    "subMenu": [
      {
        "name": "Donkey Calf Raise",
      },
      {
        "name": "Seated Calf Raise"
      },
      {
        "name": "Standing Calf Raise(Barbell)"
      },
      {
        "name": "Standing Calf Raise(Machine)"
      }
    ]
  },
  {
    "name": "Cardio",
    "subMenu": [
      {
        "name": "Aerobics",
      },
      {
        "name": "Elliptical"
      },
      {
        "name": "Pilates"
      },
      {
        "name": "Rowing machine"
      },
      {
        "name": "Running"
      },
      {
        "name": "Spining"
      },
      {
        "name": "Stair Master"
      },
      {
        "name": "Stationary Bike"
      },
      {
        "name": "Swimming"
      },
      {
        "name": "Treadmill"
      },
      {
        "name": "Walking"
      },
      {
        "name": "Yoga"
      }
    ]
  },
  {
    "name": "Chest",
    "subMenu": [
      {
        "name": "Bench Fly(One Arm)",
      },
      {
        "name": "Bench Press(Bands)"
      },
      {
        "name": "Bench press(Barbell)"
      },
      {
        "name": "Bench Press(Dumbbell)"
      },
      {
        "name": "Bench Press(One Arm)"
      },
      {
        "name": "Bench Press(Smith)"
      },
      {
        "name": "Bent-Over Crossover(Cable)"
      },
      {
        "name": "Chest press(Machine)"
      },
      {
        "name": "Crossover(Cable)"
      },
      {
        "name": "Decline Bench Press(Barbell)"
      },
      {
        "name": "Hammer Curl"
      },
      
    ]
  }, 
  {
    "name": "Forearms",
    "subMenu": [
      {
        "name": "",
      }
    ]
  },
  {
    "name": "Glutes",
    "subMenu": [
      {
        "name": "",
      }
    ]
  },
  {
    "name": "Legs",
    "subMenu": [
      {
        "name": "",
      }
    ]
  },
  {
    "name": "Shoulders",
    "subMenu": [
      {
        "name": "",
      }
    ]
  },
  {
    "name": "Triceps",
    "subMenu": [
      {
        "name": "",
      }
    ] 
  }, 
  {
    "name": "Other",
    "subMenu": [
      {
        "name": "",
      }
    ]
  }
];