import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found'),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text('Page not found'),
      ),
    );
  }
}
