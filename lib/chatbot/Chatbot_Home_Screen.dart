import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatgpt/chatbot/const.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatbotHomeScreen extends StatefulWidget {
  @override
  State<ChatbotHomeScreen> createState() => _ChatbotHomeScreenState();
}

class _ChatbotHomeScreenState extends State<ChatbotHomeScreen> {
  final searchController = TextEditingController();
  //final List<ChatMessage> _messages = [];
  StreamSubscription? subscription;

  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'abc', lastName: 'xyz');

  final ChatUser _gptUser =
      ChatUser(id: '2', firstName: 'chat', lastName: 'gpt');

  final List<ChatMessage> _messages = <ChatMessage>[];
  final List<ChatUser> _typingUser = <ChatUser>[];

  final _openAI = OpenAI.instance.build(
      token: OPENAI_API_KEY,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 10),
      ),
      enableLog: true);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          "CHATBOT",
          style: GoogleFonts.poppins(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700),
        )),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: DashChat(
          currentUser: _currentUser,
          typingUsers: _typingUser,
          messageOptions: const MessageOptions(
            containerColor: Color.fromRGBO(0, 166, 126, 1),
            textColor: Colors.white,
          ),
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _messages),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    // print(m.text);
    setState(() {
      _messages.insert(0, m);
      _typingUser.add(_gptUser);
    });

    List<Messages> messageHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();

    final request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: messageHistory,
        maxToken: 800);

    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
                user: _gptUser,
                createdAt: DateTime.now(),
                text: element.message!.content),
          );
        });
      }
    }
    setState(() {
      _typingUser.remove(_gptUser);
    });
  }
}
