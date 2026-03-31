import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/message_model.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<Message> messages,
    @Default(false) bool loading,
  }) = _ChatState;
}
