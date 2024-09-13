import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubbleFile extends StatelessWidget {
  final ChatMessageEntity chatMessageEntity;
  final Alignment alignment;
  const ChatBubbleFile({
    super.key,
    required this.alignment,
    required this.chatMessageEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
             chatMessageEntity.text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            if(chatMessageEntity.imageUrl != null)
            Image.network(
              chatMessageEntity.imageUrl!,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
