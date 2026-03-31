import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: const [
          Icon(Icons.menu, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Aise 1.3 (BETA)",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.edit, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }
}
