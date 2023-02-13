import 'package:flutter/material.dart';
import 'package:template/widgets/d_contact.dart';
import 'package:template/widgets/d_header.dart';
import 'package:template/widgets/d_home.dart';
import 'package:template/widgets/d_info.dart';
import 'package:template/widgets/d_sns.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DHeader(),
          DHome(),
          DContact(),
          DSns(),
          DInfo()
        ],
      ),
    );
  }
}

