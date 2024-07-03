import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    _initKommunicateChat();
  }

  void _initKommunicateChat() async {
    try {
      dynamic conversationObject = {
        'appId': '<YOUR_APP_ID>', // The APP_ID obtained from Kommunicate dashboard
      };

      KommunicateFlutterPlugin.buildConversation(conversationObject)
          .then((result) {
        print("Conversation builder success : " + result.toString());
      }).catchError((error) {
        print("Conversation builder error occurred : " + error.toString());
      });
    } catch (e) {
      print("Error occurred while initializing chat: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: const Center(
        child: CircularProgressIndicator(), // Or any other loading indicator
      ),
    );
  }
}
