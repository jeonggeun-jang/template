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
      title: '충남대학교',
      theme: ThemeData(
        useMaterial3: true,
        //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.standard,
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
            physics: const BouncingScrollPhysics(),
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
