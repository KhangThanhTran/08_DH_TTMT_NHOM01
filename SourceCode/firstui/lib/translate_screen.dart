// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TranslateScreen(),
      theme: ThemeData(
        primaryColor: const Color(0xFF209296),
        //accentColor: Colors.lightBlueAccent,
        fontFamily: 'Roboto',
      ),
    );
  }
}

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);
  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String translatedText = '';
  String fromLanguage = 'vi';
  String toLanguage = 'en';
  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Translator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Nhập từ muốn dịch',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: fromLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      fromLanguage = newValue!;
                    });
                  },
                  items: ['vi', 'en']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    translatedText,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                DropdownButton<String>(
                  value: toLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      toLanguage = newValue!;
                    });
                  },
                  items: ['vi', 'en']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String text = _textEditingController.text;
                Translation translation = await translator.translate(text,
                    from: fromLanguage, to: toLanguage);
                setState(() {
                  translatedText = translation.text;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Translate'),
            ),
          ],
        ),
      ),
    );
  }
}
