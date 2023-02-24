import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageProperties extends ChangeNotifier {

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusScopeNode focusNode = FocusScopeNode();
  final dio = Dio();
  bool isLoading = false;

  List<String> clientMessage = [''];

  List<String> agentMessage = [];
  List<String> agentMessageImage = [];
  List<dynamic> agentMessageButton = [];
  List agentButton = [];

  List<String> dateTime = [];

  //List<dynamic> testButton = [];

  bool scrollEventSwitch = true;

  void scrollEvent() {
    scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
    notifyListeners();
  }

  void saveClientMessage() {
    if (textEditingController.text.isNotEmpty) {
      clientMessage.add(textEditingController.text);
      postGreeting(textEditingController.text, 0);
      textEditingController.clear();
    }
    notifyListeners();
  }

  void scrollBindingEvent() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
    });
    notifyListeners();
  }

  void postGreeting(String text, int type) async {
    DateTime dt = DateTime.now();
    String hourData;
    String minuteData;
    dt.hour > 12 ? hourData = '오후 ${(dt.hour - 12).toString()}:' : hourData = '오전 ${dt.hour}:';
    dt.minute < 10 ? minuteData = '0${dt.minute}' : minuteData = '${dt.minute}';

    late String userMessage;
    if (text == 'greeting') {
      userMessage = '';
    } else {
      userMessage = text;
    }

    var response;


    if(type == 0) {
      response = await dio.post(
          //'https://hsmst.cnu.ac.kr/hyperchatbot-engine/deploy/10019/dialog',
          'https://hsmst.cnu.ac.kr/hyperchatbot-engine/deploy/10016/dialog',
          data: {'userMessage': userMessage, 'userId': 0},
          options: Options(
            headers: {'Accept': 'application/json', 'content-type': 'application/json'},
            contentType: 'application/json',
            method: 'POST',
          )
      );
    } else if (type == 1) {
      response = await dio.post(
          //'https://hsmst.cnu.ac.kr/hyperchatbot-engine/deploy/10019/dialog',
          'https://hsmst.cnu.ac.kr/hyperchatbot-engine/deploy/10016/dialog',
          data: {'intentId': userMessage, 'userId': 0},
          options: Options(
            headers: {'Accept': 'application/json', 'content-type': 'application/json'},
            contentType: 'application/json',
            method: 'POST',
          )
      );
    }

    var myJson = jsonDecode(response.toString())['replyMessage'].toString().replaceAll('정의할 수 없는 에러', '아이코 제게는 아직 그런 내용을 해석할 준비가 되지 않았어요 😥');
    var convertProtocol = myJson.replaceAll('http://', 'https://');
    var convertDomain = convertProtocol.replaceAll('10.110.20.132:18088', 'hsmst.cnu.ac.kr');
    var convertSpace = convertDomain.replaceAll('\\n', '<br>');
    final dataList = jsonDecode(convertSpace);

    var imgCheck = false;

    var buttonList = [];
    // 내가 필요한 정보 : 텍스트, 버튼 인텐트
    for (int i=0; i<dataList.length; i++) {
      List tempButton = [];
      switch (dataList[i]["type"]) {
        case 0 :
          agentMessage.add(dataList[i]['value']);
          dateTime.add(hourData + minuteData);
          break;
        case 1 :
          imgCheck = true;
          agentMessageImage.add(dataList[i]['url']);
          break;
        case 2 :
          for (int j=0; j<dataList[i]['buttonElements'].length; j++) {
            switch (dataList[i]['buttonElements'][j]['type']) {
              case 0 :
                tempButton.add(dataList[i]['buttonElements'][j]['value']);
                break;
              case 3 :
                tempButton.add(dataList[i]['buttonElements'][j]['intentId'].toString());
                break;
              case 4 :
                tempButton.add(dataList[i]['buttonElements'][j]['url']);
                break;
              case 5 :
                tempButton.add(dataList[i]['buttonElements'][j]['url']);
            }
            if(tempButton.length == 2) {
              buttonList.add(
                Padding(padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextButton(
                    onPressed: () {
                      if (tempButton[1].toString().contains('https')) {
                        launchUrl(Uri.parse('${tempButton[1]}'));
                      } else {
                        saveIntentMessage(tempButton[0], tempButton[1]);
                      }
                    },
                    child: Text(tempButton[0])
                  )
                )
              );
            }
          }
      }
    }

    if(buttonList.isNotEmpty) {
      agentButton.add(
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 58.0 * buttonList.length,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buttonList.length,
                  itemBuilder: (context, index) => buttonList[index]
                ),
              ),
            ],
          ),
        ),
      );
    } else if (buttonList.isEmpty) {
      agentButton.add('none');
    }

    if (!imgCheck) agentMessageImage.add('none');

    if(userMessage.isNotEmpty) {
      scrollBindingEvent();
    }

    notifyListeners();
  }

  void saveIntentMessage(String clientText, String intent) {
    clientMessage.add(clientText);
    postGreeting(intent, 1);
    notifyListeners();
  }
}