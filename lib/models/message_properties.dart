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
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
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
    final List dataList = jsonDecode(convertSpace);
    //var convertJson = jsonDecode(convertSpace);

    var imgCheck = false;
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
      }
    }

    if (!imgCheck) agentMessageImage.add('none');
    Logger().d('이미지 여부 : $agentMessageImage');

    /*var test = 0;
    for(int i=0; i<convertJson.length; i++) {
      switch (convertJson[i]["type"]) {
        case 0 :
          agentMessage.add(convertJson[i]["value"]);
          dateTime.add(hourData + minuteData);
          break;
        case 1 :
          agentMessageImage.add(convertJson[i]["url"]);
          break;
        case 2 :
          ++test;
          Logger().d('$test 번째 버튼');
          break;
      }
      *//*if (convertJson[i]["type"] == 0) {
        agentMessage.add(convertJson[i]["value"]);
        dateTime.add(hourData + minuteData);
      }*//*
    }*/
    scrollBindingEvent();
    notifyListeners();
  }
}