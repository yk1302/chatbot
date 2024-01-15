// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ChatMessage extends StatelessWidget {
//   final String text;
//   final String sender;
//
//   const ChatMessage({
//     super.key,
//     required this.text,
//     required this.sender,
//   });
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Row(
//       children: [
//         Container(
//           margin: EdgeInsets.only(right: 16),
//           child: CircleAvatar(child: Text(sender[0])),
//         ),
//         Expanded(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(sender,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w800,
//                     color: Colors.black,
//                     fontSize: 20)),
//             Container(
//               margin: EdgeInsets.only(top: 5.0),
//               child: Text(text,
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                       fontSize: 17)),
//             )
//           ],
//         ))
//       ],
//     );
//   }
// }
