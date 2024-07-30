// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/chat_models/chat_list_model.dart';
import 'package:gofriendsgo/model/chat_models/fetch_messages_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/view_model/fetching_chats.dart';
import 'package:gofriendsgo/widgets/chat_widgets/chat_appbar.dart';
import 'package:gofriendsgo/widgets/chat_widgets/chat_bubble.dart';
import 'package:gofriendsgo/widgets/chat_widgets/chat_field.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final ChatData chatData;
  const ChatScreen({super.key,required this.chatData});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    context.read<FetchChatsViewModel>().fetchMessages(FetchMessagesRequest(chatId: widget.chatData.id));
    
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
         preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const ChatAppbar()),
      body: Consumer<FetchChatsViewModel>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if (!value.isLoading) {
            final result = value.fetchMessagesModel!.messages;
            final List<MessageData> currentChats=[];
            for (var element in result) {
                  if (element.chatId==widget.chatData.id) {
                    currentChats.add(element);
                  }
            }
           return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount:currentChats.length,
                itemBuilder: (context, index) {
                  final message = currentChats[index];
                  return ChatBubble(
                    isCurrentUser: message.fromId==widget.chatData.id,
                    message:message.body,
                  );
                },
              ),
            ),
            _buildMessageInput(),
          ],
        );
          }
          return   const SizedBox();
        },
      
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
         Expanded(
              child: ChatField(
                controller: _messageController,
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
              
              },
            ),
          ),
        ],
      ),
    );
  }
}
