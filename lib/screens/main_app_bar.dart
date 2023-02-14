import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/message_properties.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
            tooltip: '탭하여 메뉴 확인',
          );
        },
      ),
      pinned: false,
      floating: true,
      backgroundColor: const Color(0xffd5e3ff),
      flexibleSpace: FlexibleSpaceBar(
        title: GestureDetector(
          onTap: () => context.read<MessageProperties>().scrollEvent(),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Tooltip(
              message: '탭하여 스크롤 이동',
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.all(5.0),
      ),
    );
  }
}