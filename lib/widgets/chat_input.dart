import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeigth = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeigth * 0.1,
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
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
