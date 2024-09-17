import 'dart:convert';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repo.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/chat_bubble_file.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessage() async {
    try {
      final response = await rootBundle.loadString("assets/mock_messages.json");
      final List<dynamic> decodeList = jsonDecode(response) as List;
      final List<ChatMessageEntity> _chatMessage = decodeList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();
      print(_chatMessage); // Ensure this prints valid messages
      setState(() {
        _messages = _chatMessage;
      });
    } catch (e) {
      print('Error loading messages: $e');
    }
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadInitialMessage();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthService>().getCurrentUser();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Hi $username')),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.read<AuthService>().UpdateUserName("New name!");
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthService>().logOutUser();
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubbleFile(
                  alignment: _messages[index].author.name ==
                          context.read<AuthService>().getCurrentUser()
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  chatMessageEntity: _messages[index],
                );
              },
            ),
          ),
          ChatInput(onSubmit: onMessageSent),
        ],
      ),
    );
  }
}
