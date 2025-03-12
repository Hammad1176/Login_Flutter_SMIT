// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class OpenUserScreen extends StatelessWidget {
  final String fruit_name;

  final String fruit_url;

  const OpenUserScreen({
    super.key,
    required this.fruit_name,
    required this.fruit_url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: fruit_url,
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                  fruit_url,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.red,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              fruit_name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
