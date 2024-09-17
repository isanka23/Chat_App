import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => AuthService(),
      child: const ChatApp(),
    ),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
          primaryColor: BrandColor.primaryColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black)),
      home: FutureBuilder<bool>(
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!) {
              return const ChatPage();
            } else {
              return LoginPage();
            }
          }
          return const CircularProgressIndicator();
        },
        future: context.read<AuthService>().isLoggedIn(),
      ),
      routes: {"/chat": (context) => const ChatPage()},
    );
  }
}
