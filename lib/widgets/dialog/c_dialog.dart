import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/confetti_model.dart';

class CDialog extends StatefulWidget {
  const CDialog({Key? key}) : super(key: key);

  @override
  State<CDialog> createState() => _CDialogState();
}

class _CDialogState extends State<CDialog> {
  final confettiController = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
          confettiController: confettiController,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 20,
        ),
        Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Stack(
            clipBehavior: Clip.none, alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 400,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    const Text('WELCOME !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text('안녕하세요\n여러분을 도와드릴 차차에요!\n\n상단의 메뉴를 탭하시면\n더 많은 정보를 확인하실 수 있어요!\n\n하단의 버튼을 눌러 시작해보세요'),
                    ),
                    TextButton(
                      child: const Text('시작하기'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
              const Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage('assets/images/chatacter_f.png'),
                  radius: 60,
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
