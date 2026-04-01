import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  final bool isTyping;

  const ChatHeader({super.key, required this.isTyping});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF)],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.menu, color: Colors.white),

          const SizedBox(width: 10),

          // 🔹 Avatar AI
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFF14B8A6),
            child: Icon(Icons.auto_awesome, color: Colors.white, size: 16),
          ),

          const SizedBox(width: 10),

          // 🔹 Title + Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Aise 1.3 (BETA)",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  isTyping ? "Mengetik..." : "Online",
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
