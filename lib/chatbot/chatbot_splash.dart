import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Chatbot_Home_Screen.dart';

class ChatbotSplashScreen extends StatefulWidget {
  @override
  State<ChatbotSplashScreen> createState() => _ChatbotSplashScreenState();
}

class _ChatbotSplashScreenState extends State<ChatbotSplashScreen> {
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ChatbotHomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/chatgpt.jpeg',
              fit: BoxFit.cover,
              height: height * .5,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              'Chatbot',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SpinKitCircle(
              size: 40,
              color: Colors.deepPurple.shade400,
            )
          ],
        ),
      ),
    );
  }
}
