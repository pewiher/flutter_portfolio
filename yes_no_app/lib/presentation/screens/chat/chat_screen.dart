import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi amor :)'),
        leading: const CircleAvatar(
          backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/624883661364596738/iR55zuhB_400x400.jpg'),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];
                  if (message.fromWho == FromWho.hers) {
                    return HerMessageBubble(
                      message: message,
                    );
                  }
                  return MyMessageBubble(message: message);
                },
              ),
            ),
            const SizedBox(height: 10),
            MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
              },
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
