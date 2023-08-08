// ignore_for_file: duplicate_import, unused_import, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:firstui/translator.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:firstui/camera.dart';
import 'package:firstui/camera_screen.dart';
import 'package:firstui/voice.dart';
import 'package:translator/translator.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  List<String> languages = [
    'Tiếng Việt',
    'English',
    'Hindi',
    'Arabic	',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese	',
    'Italian'
  ];
  List<String> languagescode = [
    'vi',
    'en',
    'hi',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it'
  ];
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'hi';
  String data = '';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Hindi';
  TextEditingController controller = TextEditingController(text: '');
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   translate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CircleAvatar(
        backgroundColor: Colors.pinkAccent,
        radius: 35,
        child: Icon(Icons.camera_alt_rounded, color: Colors.white),
      ),
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          //color: Color.fromARGB(255, 50, 46, 165),
          color: Color(0xFF209296),
        )),
        title: const Text(
          'Image Text Translator',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      //backgroundColor: const Color.fromARGB(255, 87, 104, 254),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: const Color(0xFF209296),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*const Text('From'),
                const SizedBox(
                  width: 100,
                ),*/
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'From',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: DropdownButton(
                    value: selectedvalue,
                    focusColor: Colors.transparent,
                    dropdownColor: const Color(0xFF209296),
                    items: languages.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        //child: Text(lang),
                        child: Text(
                          lang,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          if (lang == languages[0]) {
                            from = languagescode[0];
                          } else if (lang == languages[1]) {
                            from = languagescode[1];
                          } else if (lang == languages[2]) {
                            from = languagescode[2];
                          } else if (lang == languages[3]) {
                            from = languagescode[3];
                          } else if (lang == languages[4]) {
                            from = languagescode[4];
                          } else if (lang == languages[5]) {
                            from = languagescode[5];
                          } else if (lang == languages[6]) {
                            from = languagescode[6];
                          } else if (lang == languages[7]) {
                            from = languagescode[7];
                          } else if (lang == languages[8]) {
                            from = languagescode[8];
                          }
                          setState(() {
                            // print(lang);
                            // print(from);
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedvalue = value!;
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(50),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)),
            //border: Border.all(color: Colors.white)),
            child: Form(
              key: formkey,
              child: TextFormField(
                controller: controller,
                maxLines: null,
                minLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    errorStyle: TextStyle(color: Colors.white)),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                //color: Colors.indigo.shade100,
                color: const Color(0xFF209296),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*const Text('To'),
                const SizedBox(
                  width: 100,
                ),*/
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'To',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: DropdownButton(
                    value: selectedvalue2,
                    focusColor: Colors.transparent,
                    dropdownColor: const Color(0xFF209296),
                    items: languages.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(
                          lang,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          if (lang == languages[0]) {
                            to = languagescode[0];
                          } else if (lang == languages[1]) {
                            to = languagescode[1];
                          } else if (lang == languages[2]) {
                            to = languagescode[2];
                          } else if (lang == languages[3]) {
                            to = languagescode[3];
                          } else if (lang == languages[4]) {
                            to = languagescode[4];
                          } else if (lang == languages[5]) {
                            to = languagescode[5];
                          } else if (lang == languages[6]) {
                            to = languagescode[6];
                          } else if (lang == languages[7]) {
                            to = languagescode[7];
                          } else if (lang == languages[8]) {
                            to = languagescode[8];
                          }
                          setState(() {
                            print(lang);
                            print(from);
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedvalue2 = value!;
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(60),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)),
            //border: Border.all(color: Colors.black)),
            child: Center(
              child: SelectableText(
                data,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      )),

      bottomNavigationBar: Container(
        color: const Color(0xFF209296),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TranslatorApp(),
                    )); // Xử lý khi nhấn biểu tượng dịch text
              },
              icon: const Icon(
                Icons.translate,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoiceApp(),
                    )); // Xử lý khi nhấn biểu tượng dịch bằng giọng nói
              },
              icon: const Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CameraApp(),
                    )); // Xử lý khi nhấn biểu tượng dịch bằng micro
              },
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
