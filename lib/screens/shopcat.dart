// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class shopcat extends StatelessWidget {
  const shopcat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: const Center(
        child: Text("Category Page"),
      ),
    );
  }
}
