import 'package:flutter/material.dart';
import 'package:template/screens/main_character.dart';

class DHeader extends StatelessWidget {
  const DHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: UserAccountsDrawerHeader(
        margin: EdgeInsets.only(bottom: 0.0),
        decoration: BoxDecoration(color: Color(0xffa8c8ff)),
        currentAccountPicture: Tooltip(
          message: '차차',
          child: CircleAvatar(
            backgroundColor: Color(0xffd5e3ff),
            backgroundImage: AssetImage('assets/images/character.png'),
          ),
          /*child: GestureDetector(
            child: const Hero(
              tag: 'characterHero',
              child: CircleAvatar(
                backgroundColor: Color(0xffd5e3ff),
                backgroundImage: AssetImage('assets/images/character.png'),
              ),
            ),
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 1200),
                reverseTransitionDuration: const Duration(milliseconds: 800),
                pageBuilder: (_, __, ___) => const MainCharacter()
              )
            )
          ),*/
        ),
        accountName: Text('충남대학교'),
        accountEmail: Text('CHUNGNAM NATIONAL UNIVERSITY'),
      ),
    );
  }
}
