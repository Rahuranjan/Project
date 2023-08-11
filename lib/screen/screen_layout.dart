import 'package:flutter/material.dart';
import 'package:project/components/exercise/tabs/show_data.dart';
// import 'package:project/screen/profile.dart';
import 'package:project/screen/workouts.dart';
import 'package:project/screen/calendar_screen.dart';
import 'package:project/screen/exercises.dart';
import 'package:project/screen/login_screen.dart';
// import 'package:project/screen/signup_screen.dart';
// import 'package:project/screen/youtube_link.dart';


class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  // PageController pageController = PageController();
  int currentPage = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Workouts(),
    const ExerciseScreen(),
    const CalendarScreen(),
    const ShowData(),
    const LoginPage(),
  ];

  

  void changePage(int page) {
    // pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
          currentIndex: currentPage,
          onTap: changePage,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.yellowAccent,
          // unselectedItemColor: const Color(0xFF526480),
          unselectedItemColor: Colors.grey.shade500,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded),
                label: "Home",
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center_rounded),
                label: "Exercise",
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.event_rounded),
                label: "Calendar",
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.man_rounded),
                label: "Profile",
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_rounded),
                label: "Statisics",
                ),
            
          ]),
    );
  }
}
