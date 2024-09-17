import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/picker_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({
    super.key,
    required this.onSubmit,
  });

  final chatMessageController = TextEditingController();

  void onSendButtonPressed(BuildContext context) async {
    String? userNameFromCache =
        await context.read<AuthService>().getCurrentUser();
    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text,
      id: "244",
      createdAt: DateTime.now().microsecondsSinceEpoch,
      author: Author(name: userNameFromCache!),
    );
    onSubmit(newChatMessage);
    chatMessageController.clear(); // Clear the input after sending
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.1,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 111, 237, 76),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return NetworkImagePickerBody();
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              controller: chatMessageController,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () => onSendButtonPressed(context),
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
