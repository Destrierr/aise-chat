import 'package:aichat/page/chat/bloc/chat_bloc.dart';
import 'package:aichat/page/chat/bloc/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/chat_header.dart';
import '../../components/chat_list.dart';
import '../../components/chat_input_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF2A0845), Colors.black]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const ChatHeader(),

              Expanded(
                child: BlocConsumer<ChatBloc, ChatState>(
                  listener: (context, state) {
                    // 🔥 auto scroll setiap ada message / loading berubah
                    _scrollToBottom();
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Expanded(
                          child: ChatList(
                            messages: state.messages,
                            isLoading: state.loading,
                            scrollController: _scrollController, // 🔥 PASS INI
                          ),
                        ),
                        const ChatInputBar(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
