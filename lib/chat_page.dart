import 'package:chat_app/widgets/chat_bubble_file.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Hi Isanka')),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubbleFile(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: 'Hello');
                  }),
            ),
            const ChatInput(),
          ],
        ));
  }
}
