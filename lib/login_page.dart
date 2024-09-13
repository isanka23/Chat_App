import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/widgets/login_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    Navigator.pushReplacementNamed(context, "/chat", arguments: "LEBRON");
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Let\'s sign you in',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Welcome Back!!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.cyan,
                    ),
                  ),
                  Image.asset(
                    'assets/login page/loginPic.jpg',
                    width: 300,
                    height: 300,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        LoginTextFiled(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: emailController,
                          labelTextForField: 'Email',
                        ),
                        verticalSpacing(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        LoginTextFiled(
                          hasAsterisks: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: passwordController,
                          labelTextForField: 'Password',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      autofocus: true,
                      onPressed: () {
                        loginUser(context);
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text(
                    "Find Us on Social Media",
                    style: TextStyle(fontSize: 15),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.access_alarm),
                        onPressed: () => launchUrl(
                            "https://www.linkedin.com/in/isanka-samarawickrama-153026268/" as Uri),
                      ),
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        onPressed: () => launchUrl(
                            "https://www.facebook.com/isanka.samarawickrama" as Uri),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
