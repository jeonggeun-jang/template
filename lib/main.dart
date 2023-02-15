import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/message_properties.dart';
import 'package:template/screens/main_app_bar.dart';
import 'package:template/screens/main_body.dart';
import 'package:template/screens/main_drawer.dart';
import 'package:template/screens/main_text_field.dart';
import 'package:template/widgets/dialog/c_dialog.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MessageProperties>(create: (context) => MessageProperties()),
      ],
      child: const MainApp(),
    )
);

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CNU | CHATBOT',
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      showDialog(
        context: context,
        builder: (BuildContext context) => const CDialog()
      );

      /*final dio = Dio();
      List<String> greeting = [];
      List<String> greetingImage = [];

      final response = await dio.post(
        'https://hsmst.cnu.ac.kr/hyperchatbot-engine/deploy/10016/dialog',
        data: {"userMessage": "", "userId": 0},
        options: Options(
          headers: {'Accept': 'application/json', 'content-type': 'application/json'},
          contentType: 'application/json',
          method: 'POST',
        )
      );

      Logger().d(response);

      var myJson = jsonDecode(response.toString())['replyMessage'].toString();
      var convertProtocol = myJson.replaceAll('http', 'https');
      var convertDomain = convertProtocol.replaceAll('10.110.20.132:18088', 'hsmst.cnu.ac.kr');
      var convertSpace = convertDomain.replaceAll('\\n', '<br>');
      var convertJson = jsonDecode(convertSpace);

      for(int i=0; i<convertJson.length; i++) {
        if (convertJson[i]["type"] == 0) {
          greeting.add(convertJson[i]["value"]);
        } else if (convertJson[i]["type"] == 1) {
          greetingImage.add(convertJson[i]["url"]);
        }
      }

      Logger().d(greeting);
      Logger().d(greetingImage);*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        drawer: const MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 53.0),
          child: CustomScrollView(
            controller: context.read<MessageProperties>().scrollController,
            slivers: const [
              MainAppBar(),
              MainBody(),
            ],
          ),
        ),
        bottomSheet: const MainTextField(),
      ),
    );
    //bottomSheet: const MainTextField(),
  }
}
