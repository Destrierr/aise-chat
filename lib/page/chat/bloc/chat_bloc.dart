import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../../../services/api_service.dart';
import '../../../models/message_model.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<SendMessage>((event, emit) async {
      debugPrint("BLOC EVENT MASUK: ${event.message}");

      // 1. user message
      final userMsg = Message(text: event.message, isUser: true);

      // 2. list awal + AI placeholder
      final messages = [...state.messages, userMsg];

      final aiPlaceholder = Message(text: "", isUser: false);
      messages.add(aiPlaceholder);

      emit(state.copyWith(messages: messages, loading: true));

      try {
        // 3. panggil stream API
        final stream = await ApiService.sendMessageStream(event.message);

        String buffer = "";

        await for (final chunk in stream) {
          buffer += chunk;

          final updatedMessages = [...messages];

          // update message terakhir (AI)
          updatedMessages[updatedMessages.length - 1] = Message(
            text: buffer,
            isUser: false,
          );

          emit(state.copyWith(messages: updatedMessages, loading: false));
        }
      } catch (e) {
        debugPrint("ERROR STREAM: $e");

        emit(state.copyWith(loading: false));
      }
    });
  }
}
