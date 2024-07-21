import 'package:flutter/material.dart';

class ChatBubbleFile extends StatelessWidget {
  final String message;
  final Alignment alignment;
  const ChatBubbleFile({
    super.key,
    required this.message,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
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
              message,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/375px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg",
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
