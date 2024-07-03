import 'package:flutter/material.dart';
import 'package:kommunicate/chat_page.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kommunicate Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  KommunicateFlutterPlugin.openConversations();
                },
                child: const Text('Open Conversation')),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                dynamic conversationObject = {
                  'appId': '3461bac14e40902c629b0403b55ebf791',
                  'isSingleConversation': false
                };

                await KommunicateFlutterPlugin.buildConversation(
                        conversationObject)
                    .then((result) {
                  print("Conversation builder success: " +
                      result
                          .toString()); //result.toString() will be the clientChannelKey
                }).catchError((error) {
                  print("Conversation builder error occurred : " +
                      error.toString());
                });
              },
              child: const Text('Go to Chat'),
            ),
          ],
        ),
      ),
    );
  }
}
