import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = "perfile-screen";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cuenta")),
      body:
          const Center(child: Text("PROFILE", style: TextStyle(fontSize: 40))),
    );
  }
}
