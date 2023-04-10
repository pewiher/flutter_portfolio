import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();
    final underLineInput = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );

    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'Ingrese un texto',
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final text = controller.text;
          controller.clear();
          focusNode.unfocus();
          onValue(text);
        },
      ),
      enabledBorder: underLineInput,
      focusedBorder: underLineInput,
    );
    return TextFormField(
      controller: controller,
      decoration: inputDecoration,
      focusNode: focusNode,
      onTapOutside: (event) => focusNode.unfocus(),
      onFieldSubmitted: (value) {
        controller.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
