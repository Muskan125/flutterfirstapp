import 'package:firstapp/Homefile.dart';
import 'package:firstapp/screens/shopcat.dart';
import 'package:flutter/material.dart';

Drawer mydrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 134, 82, 230),
          ),
          child: Center(
            child: Text(
              'My Application',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => homefile()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.filter_list),
          /*CircleAvatar(
              child: Image.asset(
            "assets/flag.png",
            fit: BoxFit.fill,
            height: 30,
          )) to add image in place of icons*/
          title: const Text('Shop by Category'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const shopcat()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.token_sharp),
          title: const Text('Explore Brands'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('My Wishlist'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Contact Us'),
          onTap: () {},
        ),
      ],
    ),
  );
}
