// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/chat_widgets/chat_appbar.dart';
import 'package:gofriendsgo/widgets/chat_widgets/chat_bubble.dart';
import 'package:gofriendsgo/widgets/chat_widgets/chat_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];

  final TextEditingController _messageController = TextEditingController();

  void _addMessage(String message) {
    setState(() {
      _messages.add({
        'message': message,
        'isCurrentUser': false,
      });
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.07, context)),
          child: const ChatAppbar()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  isCurrentUser: message['isCurrentUser'],
                  message: message['message'],
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
              child: ChatField(
            hinttext: 'Type your message',
          )),
          const CustomSizedBoxWidth(0.02),
          Container(
            width: mediaquerywidth(0.13, context),
            height: mediaqueryheight(0.06, context),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: AppColors.gradientColors)),
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: AppColors.whiteColor,
              ),
              onPressed: () {
                if (_messageController.text.trim().isNotEmpty) {
                  _addMessage(_messageController.text.trim());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
