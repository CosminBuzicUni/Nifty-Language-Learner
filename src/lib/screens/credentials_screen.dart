import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nifty_language_learner/classes/http.dart';

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({super.key});

  @override
  State<CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          width: 500,
          height: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 211, 211, 211),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
        
            children: [
              Text("Choose a login method!",
              style: Theme.of(context).textTheme.headlineMedium),
              Text("Login by username"),
              Text("Username"),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              Text("Password"),
              TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Sent authentication request!");
                  Http.authenticateUser(
                    usernameController.text,
                    passwordController.text,
                  ).then((response) {
                    print("Response: "+response.body.toString());
                    print("Response: "+response.statusCode.toString());
                    if (response.statusCode == 200) {
                      // Handle successful authentication
                      print("Authentication succesful!");
                      if(mounted){
                      context.go('/language_screen');
                      }
                    } else {
                      // Handle authentication error
                      print("Authentication failed!"+response.statusCode.toString());
                    }
                  });
                  // context.go('/credentials_screen');
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
