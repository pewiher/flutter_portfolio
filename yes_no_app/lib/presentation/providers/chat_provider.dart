import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messagesList = [
    Message(text: 'Hola Amor', fromWho: FromWho.me),
    Message(text: 'Ya llegastes', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    messagesList.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
    moveScrollToBotton();
    if (text.endsWith('?')) herReplay();
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToBotton();
  }

  void moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 300));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
