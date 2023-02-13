import 'package:flutter/material.dart';
import 'package:template/screens/main_character.dart';

class DHeader extends StatelessWidget {
  const DHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: UserAccountsDrawerHeader(
        margin: const EdgeInsets.only(bottom: 0.0),
        decoration: const BoxDecoration(color: Color(0xffa8c8ff)),
        currentAccountPicture: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Tooltip(
            message: '차차 소개',
            child: GestureDetector(
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
            ),
          ),
        ),
        accountName: const Text('차차 | 충남대학교'),
        accountEmail: const Text('CHUNGNAM NATIONAL UNIVERSITY'),
      ),
    );
  }
}
