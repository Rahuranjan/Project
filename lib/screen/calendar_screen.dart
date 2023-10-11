import 'package:flutter/material.dart';
import 'package:project/screen/event_page.dart';
// import 'package:project/screen/exercises.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void selectedDay(selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => EventPage(date: focusedDay)));
    }
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text(
          "Calendar",
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.settings,
          color: Colors.yellow,
        ),
      ),
      body: Container(
        color: Colors.black, 
        child: TableCalendar(
         headerStyle: const HeaderStyle(
           formatButtonVisible: false, titleCentered: true
         ),
         locale: 'en_US',
         firstDay: DateTime.utc(2010, 10, 16),
         lastDay: DateTime.utc(2030, 3, 14),
         focusedDay: DateTime.now(),
         calendarStyle: const CalendarStyle(
             todayDecoration: BoxDecoration(
                 color: Colors.yellow, shape: BoxShape.circle)),
         onDaySelected: selectedDay,
          ),
      ),
    );
  }
}
