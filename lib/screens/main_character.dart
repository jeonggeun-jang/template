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
                  Text('안녕! 내 이름은 차차(CHACHA)야!\n1952년 충남대학교가 설립되던 해에 대전에 세 마리의 백마가 탄생했다는걸 알고있니?'),
                  SizedBox(height: 10.0),
                  Text('우리 형제들은 모두 충남대에 입학해서 학교 생활을 시작했어. 졸업 즈음에는 용맹함과 총명함으로 인정받은 첫째와 둘째가 초대 총장님의 권유로 충남대를 지키는 백마상이 되었지!'),
                  SizedBox(height: 10.0),
                  Text('이들은 오늘도 2학생 회관 옆에서 충남대를 빛내고 있어! 😎'),
                  SizedBox(height: 10.0),
                  Text('하지만 자유를 사랑하는 나는 더 넓은 세계를 경험하고 싶었어. 과감히 휴학 후 세계 여행을 떠났고 2022년, 70년만에 충남대에 돌아오게 되었어'),
                  SizedBox(height: 10.0),
                  Text('충남대를 사랑하기에 갈기와 꼬리를 학교 상징색에 맞게 푸른색으로 물들이는건 덤이었지 ~'),
                  SizedBox(height: 10.0),
                  Text('친구들은 내가 공감능력이 뛰어나고 항상 친구를 위해 말벗이 되어주는 성격이래. 고민 있는 친구들에게 차차 잘 될 거라며 위로해주고 힘든 일에도 으랏차차 외치며 발 벗고 나서기 때문일까?'),
                  SizedBox(height: 10.0),
                  Text('친구들은 이런 내가 사랑스럽다며 차차라는 이름을 선물해줬어🥰'),
                  SizedBox(height: 10.0),
                  Text('오늘도 난 도움이 필요한 친구들을 찾아 캠퍼스 이곳 저곳을 신나게 뛰어다닐 예정이야! 나를 본다면 반갑게 인사해줘!'),
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

