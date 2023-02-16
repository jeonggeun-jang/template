import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class MessageProperties extends ChangeNotifier {

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusScopeNode focusNode = FocusScopeNode();
  final dio = Dio();
  bool isLoading = false;

  List<String> clientMessage = [''];

  List<String> agentMessage = [];
  List<String> agentMessageImage = [];
  List<String> agentMessageButton = [];

  List<String> dateTime = [];

  bool scrollEventSwitch = true;

  void scrollEvent() {
    scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    notifyListeners();
  }

  void saveClientMessage() {
    if (textEditingController.text.isNotEmpty) {
      clientMessage.add(textEditingController.text);
      postGreeting(textEditingController.text);
      textEditingController.clear();
    }
    notifyListeners();
  }

  void scrollBindingEvent() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
    notifyListeners();
  }

  void postGreeting(String text) async {
    DateTime dt = DateTime.now();
    var hourData;
    var minuteData;
    dt.hour > 12 ? hourData = '오후 ${(dt.hour - 12).toString()}:' : hourData = '오전 ${dt.hour}:';
    dt.minute < 10 ? minuteData = '0${dt.minute}' : minuteData = '${dt.minute}';

    late String userMessage;
    if (text == 'greeting') {
      userMessage = '';
    } else {
      userMessage = text;
    }

    final response = await dio.post(
      'https://hsmst.cnu.ac.kr/hyperchatbot-engine/deploy/10019/dialog',
      //'https://hsmst.cnu.ac.kr/hyperchatbot-engine/deploy/10016/dialog',
      data: {'userMessage': userMessage, 'userId': 0},
      options: Options(
        headers: {'Accept': 'application/json', 'content-type': 'application/json'},
        contentType: 'application/json',
        method: 'POST',
      )
    );

    var myJson = jsonDecode(response.toString())['replyMessage'].toString();
    var convertProtocol = myJson.replaceAll('http', 'https');
    var convertDomain = convertProtocol.replaceAll('10.110.20.132:18088', 'hsmst.cnu.ac.kr');
    var convertSpace = convertDomain.replaceAll('\\n', '<br>');
    final dataList = jsonDecode(convertSpace);

    //Logger().d(dataList);

    var imgCheck = false;
    var buttonTempText = [];
    var buttonTempIntent = [];
    var buttonTempUrl = [];

    // 내가 필요한 정보 : 텍스트, 버튼 인텐트

    for (int i=0; i<dataList.length; i++) {
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
                buttonTempText.add(dataList[i]['buttonElements'][j]['value']);
                break;
              case 3 :
                buttonTempIntent.add(dataList[i]['buttonElements'][j]['intentId']);
                break;
              case 4 :
                buttonTempUrl.add(dataList[i]['buttonElements'][j]['url']);
                break;
            }
          }
      }
    }
    Logger().d(buttonTempText);
    Logger().d(buttonTempIntent);
    Logger().d(buttonTempUrl);
    if (!imgCheck) agentMessageImage.add('none');

    scrollBindingEvent();
    notifyListeners();
  }
}