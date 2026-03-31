import 'package:aichat/components/typing_bubble.dart';
import 'package:aichat/models/message_model.dart';
import 'package:flutter/material.dart';
import 'chat_bubble.dart';

class ChatList extends StatelessWidget {
  final List<Message> messages;
  final bool isLoading;
  final ScrollController scrollController;

  const ChatList({
    super.key,
    required this.messages,
    required this.isLoading,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    // Filter: jangan tampilkan message kosong dari AI
    final visibleMessages = messages
        .where((msg) => msg.isUser || msg.text.isNotEmpty)
        .toList();

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(12),
      itemCount: visibleMessages.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (isLoading && index == visibleMessages.length) {
          return const TypingBubble();
        }

        final msg = visibleMessages[index];
        return ChatBubble(text: msg.text, isUser: msg.isUser);
      },
    );
  }
}
