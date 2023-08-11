import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback press;
  const TextBox({super.key, required this.text, required this.icon, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.yellow,),
            const SizedBox(width: 20,),
            Expanded(child: Text(text, style: TextStyle(color: Colors.grey.shade100),)),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[100],)
          ],
        ),
        ),
    );
  }
}
