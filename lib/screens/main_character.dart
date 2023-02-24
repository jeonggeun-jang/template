import 'package:flutter/material.dart';

class MainCharacter extends StatelessWidget {
  const MainCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0)
              ),
              child: Container(
                color: const Color(0xffa8c8ff),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Tooltip(
                    message: '돌아가기',
                    child: GestureDetector(
                      //context, PageRouteBuilder(transitionDuration: const Duration(milliseconds: 1200), pageBuilder: (_, __, ___) => const MainCharacter()
                      onTap: () => Navigator.pop(context),
                      child: Hero(
                        tag: 'characterHero',
                        child: Image.asset('assets/images/character.png', fit: BoxFit.fitHeight)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('차차 소개 (스토리)', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.0),
                  Text('안녕! 내 이름은 차차(CHACHA)야!'),
                  SizedBox(height: 10.0),
                  Text('(이하 생략) 추가 예정'),
                  SizedBox(height: 20.0),
                  Text('돌아가시려면 뒤로가기 버튼 혹은 차차를 탭해주세요', style: TextStyle(color: Color(0xff062a8a))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

