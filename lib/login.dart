import 'package:firstapp/Homefile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class login extends StatelessWidget {
  login({super.key});

  TextEditingController unamecontroller = TextEditingController();

  String uname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  width: double.infinity,
                  color: const Color(0xfff1cf78),
                  child: Image.asset("assets/logimg.png")),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 30),
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 3,
                          right: 15,
                          bottom: 3,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(73, 0, 0, 0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "Login in or Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff1cf78),
                          ),
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: const Color.fromARGB(73, 0, 0, 0),
                            )),
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 3,
                              right: 8,
                              bottom: 3,
                            ),
                            margin: const EdgeInsets.only(left: 50),
                            child: Image.asset(
                              "assets/flag.png",
                              width: 30,
                            )),
                        const SizedBox(
                          width: 25,
                        ),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: TextField(
                            controller: unamecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Your Name',
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.only(left: 90, right: 90),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 245, 210, 94),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('name', unamecontroller.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homefile()),
                          );
                        },
                        child: const Text("Sign up",
                            style: TextStyle(
                                // ignore: unnecessary_const
                                color: const Color.fromARGB(237, 24, 24, 24),
                                fontSize: 20)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
