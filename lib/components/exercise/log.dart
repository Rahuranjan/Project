import 'package:flutter/material.dart';
import 'package:project/components/exercise/tabs/info.dart';
import 'package:project/components/exercise/tabs/log_screen.dart';
import 'package:project/components/exercise/tabs/my_stats.dart';
import 'package:provider/provider.dart';

import '../../data/provider.dart';

class Log extends StatefulWidget {
  // final String title;

  const Log({super.key,});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  void _showDialog(BuildContext buildContext) {
    showDialog(
        context: buildContext,
        builder: (buildContext) {
          return Dialog(
            child: Container(
              height: 340,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "60",
                        style: TextStyle(color: Colors.yellow, fontSize: 30),
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Vibrate when complete",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: isChecked1,
                      onChanged: (val) {
                        setState(() {
                          isChecked1 = val!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Beep when complete",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: isChecked2,
                      onChanged: (val) {
                        setState(() {
                          isChecked2 = val!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Stopwatch mode",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: isChecked3,
                      onChanged: (val) {
                        setState(() {
                          isChecked3 = val!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Auto start after set",
                        style: TextStyle(color: Colors.white),
                      ),
                      tileColor: Colors.white,
                      value: isChecked4,
                      onChanged: (val) {
                        setState(() {
                          isChecked4 = val!;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration:
                                  const BoxDecoration(color: Colors.yellow),
                              child: const Text(
                                "START",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration:
                                  const BoxDecoration(color: Colors.yellow),
                              child: const Text(
                                "STOP",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration:
                                  const BoxDecoration(color: Colors.yellow),
                              child: const Text(
                                "RESET",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final title = Provider.of<PrimaryMuscleProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
          title: Text(
            title.subMenuItemName.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.yellow,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  _showDialog(context);
                },
                icon: const Icon(
                  Icons.alarm,
                  color: Colors.yellow,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: const TabBar(
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.white,
                  isScrollable: false,
                  indicatorColor: Colors.yellow,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      text: "LOG",
                    ),
                    Tab(
                      text: "INFO",
                    ),
                    Tab(
                      text: "MY STATS",
                    ),
                  ]),
            ),
            const Expanded(
              child: TabBarView(children: [
                LogScreen(),
                Info(),
                MyStats(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
