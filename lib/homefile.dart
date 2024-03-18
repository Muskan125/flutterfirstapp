import 'dart:async';

import 'package:firstapp/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homefile extends StatefulWidget {
  homefile({super.key});

  @override
  State<homefile> createState() => _homefileState();
}

class _homefileState extends State<homefile> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    preferance();
    super.initState();
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (activePage < imglist.length) {
          activePage++;
        } else {
          activePage = 0;
        }

        _pageController.animateToPage(
          activePage,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
  }

  var activePage = 0;
  var shared;
  List<String> imglist = [
    "assets/simg1.jpg",
    "assets/simg2.jpg",
    "assets/simg3.jpg",
  ];
  void preferance() async {
    final prefs = await SharedPreferences.getInstance();
    shared = prefs.getString('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoplift'),
        backgroundColor: Color.fromARGB(166, 155, 64, 114),
      ),
      drawer: mydrawer(context),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                prefixIcon: Icon(Icons.search, size: 30),
                //border: OutlineInputBorder(),
                hintText: 'search...',
                // icon: new Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: PageView.builder(
                itemCount: imglist.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    // margin: EdgeInsets.only(top: 5),
                    child: Image.asset(
                      imglist[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
          Container(
            width: double.infinity,
            height: 40,
            color: Color.fromARGB(214, 170, 60, 97),
            child: Center(
              child: Text(shared ?? "Welcome to shoplift made by hearts & love",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic,
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
