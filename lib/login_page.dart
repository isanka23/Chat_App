import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/widgets/login_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    final authService = context.read<AuthService>();
    await authService.loginUser(userNameController.text);
    Navigator.pushReplacementNamed(context, "/chat", arguments: "LEBRON");
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  Widget _buildHeader(context) {
    return Column(
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
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
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
                  "https://www.linkedin.com/in/isanka-samarawickrama-153026268/"
                      as Uri),
            ),
            IconButton(
              icon: const Icon(Icons.facebook),
              onPressed: () => launchUrl(Uri.parse(
                  "https://www.linkedin.com/in/isanka-samarawickrama-153026268/")),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildForm(context) {
    return Column(
      children: [
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
                controller: userNameController,
                labelTextForField: 'User Name',
              ),
              verticalSpacing(
                MediaQuery.of(context).size.height * 0.02,
              ),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
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
            onPressed: () async {
              try {
                if (_formkey.currentState!.validate()) {
                  await loginUser(context);
                }
              } catch (e) {
                print("Error during login: $e");
              }
            },
            child: const Text('Login'),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                LayoutBuilder(builder: (context, BoxConstraints constraints) {
              if (constraints.maxWidth < 1000) {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _buildHeader(context),
                          _buildForm(context),
                          _buildFooter(),
                        ],
                      ),
                    )
                  ],
                );
              }
              return Center(
                child: Column(
                  children: [
                    _buildHeader(context),
                    _buildForm(context),
                    _buildFooter(),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
