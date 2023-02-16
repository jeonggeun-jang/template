import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonColumn extends StatefulWidget {
  ButtonColumn({Key? key}) : super(key: key);

  final ex = [
    ElevatedButton(onPressed: (){}, child: const Text('dd')),
    ElevatedButton(onPressed: (){}, child: const Text('dd')),
    ElevatedButton(onPressed: (){}, child: const Text('dd')),
    ElevatedButton(onPressed: (){}, child: const Text('dd')),
  ];

  @override
  State<ButtonColumn> createState() => _ButtonColumnState();
}

class _ButtonColumnState extends State<ButtonColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.ex
    );
  }
}