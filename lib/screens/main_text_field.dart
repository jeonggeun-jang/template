import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/message_properties.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final OutlineInputBorder lineStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(color: Colors.transparent)
    );

    return Container(
      height: 53.0,
      color: const Color(0xffd5e3ff),
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        //focusNode: context.read<MessageProperties>().focusNode,
        autofocus: false,
        controller: context.read<MessageProperties>().textEditingController,
        decoration: InputDecoration(
          enabledBorder: lineStyle,
          focusedBorder: lineStyle,
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          hintText: '텍스트를 입력하세요',
          hintStyle: const TextStyle(color: Color(0xff001555)),
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.send, color: Color(0xff001555)),
            onPressed: () => context.read<MessageProperties>().saveClientMessage()
          ),
        ),
        onEditingComplete: () =>context.read<MessageProperties>().saveClientMessage()
      ),
    );
  }
}

