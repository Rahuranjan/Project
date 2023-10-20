import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/screen/youtube_link.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Primary Type:       Abs",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  "Muscle(S) Worked: abdominals, lower back",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                ),
                const Center(
                  child: Icon(
                    Icons.sports_gymnastics,
                    size: 175,
                  ),
                ),
                const Text(
                  "Description:",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  "Place a barbell on the floor in front of your feet. Bend at the waist abd grip the barbell with a shoulder width overhand grip. with a slow back is straight. Keep your arms straight throughout the exercise. Roll back up raising your ips and butt as you return to the starting position.",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              color: Colors.black,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View on Youtube",
                    style: TextStyle(color: Colors.yellow, fontSize: 18),
                  ),
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Colors.yellow,
                  )
                ],
              )),
          Expanded(child: const YoutubeScreen()),
        ],
      ),
    );
  }
}
