// ignore_for_file: unused_import

import 'package:firstui/voice.dart';
import 'package:flutter/material.dart';
import 'translate_screen.dart';
import 'package:firstui/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        backgroundColor: const Color(0xFF209296),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Our',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'PORTABLE TRANSLATOR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32.0),
              const Icon(
                Icons.sync,
                color: Colors.pinkAccent,
                size: 72.0,
              ),
              const SizedBox(height: 16.0),
              Image.asset(
                'assets/images/open-book.png',
                height: 200.0,
                width: 200.0,
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Translating from and to any languages,\nfrom the tip of your hand,\nanywhere you need it',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 75.0),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(
                        builder: (context) =>
                            const TranslatorApp()), // Chuyển đến TranslateScreen
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 48.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 24.0,
                  ),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
