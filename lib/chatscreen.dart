import 'package:flutter/material.dart';
import 'package:flutterprj/login.dart';
import 'package:flutterprj/personalscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenhome extends StatefulWidget {
  const Screenhome({super.key});

  @override
  State<Screenhome> createState() => _ScreenhomeState();
}

class _ScreenhomeState extends State<Screenhome> {
  final List<String> names = [
    'John',
    'jane',
    'Akhil',
    'Christy',
    'Diana',
    'Habeeb',
    'Aswin',
    'Rakesh',
    'Aalice',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
        centerTitle: true,
        leading: const Icon(Icons.home),
        elevation: 10,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 4), () {
                      Navigator.of(context).pop(true);
                    });
                    return AlertDialog(
                      content: const Text('Are you sure you want to Delete '),
                      actions: [
                        TextButton(
                            onPressed: () {
                              signout(context);
                            },
                            child: const Text(
                              'DELETE',
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('CANCEL'))
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete)),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(
                    const Duration(seconds: 4),
                    () {
                      Navigator.of(context).pop(true);
                    },
                  );
                  return AlertDialog(
                    content: const Text('Are you sure you want to Delete '),
                    actions: [
                      TextButton(
                        onPressed: () {
                          signout(context);
                        },
                        child: const Text(
                          'Signout',
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('CANCEL'))
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            final profile = names[index % names.length];
            return ListTile(
              title: Text(profile),
              subtitle: const Text(
                'Hey there! I am using whatsapp',
                style: TextStyle(
                    fontFamily: AutofillHints.creditCardExpirationDate),
              ),
              leading: index % 2 == 0
                  ? const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/download (1).jpeg'),
                    )
                  : Container(
                      width: 60,
                      height: 60,
                      color: Colors.black,
                      child: Image.asset('assets/images/messi-world-cup.jpg'),
                    ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return messagescreen(
                        name: profile,
                      );
                    },
                  ),
                );
              },
              trailing: Text('1$index:00 PM'),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: 30,
        ),
      ),
    );
  }
}

signout(BuildContext ctx) async {
  final sharedprefs = await SharedPreferences.getInstance();
  await sharedprefs.clear();
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => const LoginScreen()),
      (route) => false);
}
