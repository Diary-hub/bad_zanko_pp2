import 'package:bad_zanko_pp/exam.dart';
import 'package:bad_zanko_pp/kurdishAppbar.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = 'diary';
  String password = '1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newMethod("Welcome Page"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Row()),
          const Icon(
            Icons.person_3,
            size: 100,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red[200],
                prefixIcon: const Icon(Icons.email),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red[200],
                prefixIcon: const Icon(Icons.password),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
              width: 300,
              height: 100,
              child: ElevatedButton(
                  onPressed: () {
                    String emailEntered = emailController.text;
                    String passwordEntered = passwordController.text;

                    if (emailEntered == email && passwordEntered == password) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Good Login"),
                              content: const Text("Peroza Login Bwi"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => ExamPage(
                                                username: emailEntered,
                                              )));
                                    },
                                    child: const Text("Go TO page"))
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Faild Login"),
                              content: Text("Peroza Login Nabbwiii"),
                            );
                          });
                    }
                  },
                  child: const Text("Login"))),
          const Expanded(child: Row()),
        ],
      ),
    );
  }
}
