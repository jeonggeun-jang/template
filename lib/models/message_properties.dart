import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class MessageProperties extends ChangeNotifier {

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusScopeNode focusNode = FocusScopeNode();

  List<String> clientMessage = [];
  List<String> agentMessage = [];

  bool scrollEventSwitch = true;

  void scrollEvent() {
    scrollEventSwitch
      ? scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 2000), curve: Curves.bounceOut)
      : scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 2000), curve: Curves.bounceOut);
    scrollEventSwitch = !scrollEventSwitch;
    notifyListeners();
  }

  void saveClientMessage() {
    if (textEditingController.text.isNotEmpty) {
      clientMessage.add(textEditingController.text);
      textEditingController.clear();
      scrollBindingEvent();
    }
    Logger().d(clientMessage);
    notifyListeners();
  }

  void scrollBindingEvent() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
    notifyListeners();
  }
}