// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterprj/main.dart';
import 'package:flutterprj/chatscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // bool isdataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.app_registration_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        title: const Text('WhatsApp Demo'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: AutofillHints.addressCity,
                      color: Colors.purple),
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password?',
                  ),
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      checkLogin(context);
                    } else {}
                  },
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = usernameController.text;
    final password = passwordController.text;
    const myname = 'Jasirpk';
    const scrtCode = '12345678';
    if (myname == username && scrtCode == password) {
      // Go to Home
      final sharedprefs = await SharedPreferences.getInstance();
      await sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => const Screenhome()),
      );
    } else {
      const errorMessage = 'Username or password does not match';

      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 233, 59, 46),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(15),
          content: Text(errorMessage),
        ),
      );
    }
  }
}
