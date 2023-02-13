import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/message_properties.dart';
import 'package:template/screens/main_app_bar.dart';
import 'package:template/screens/main_body.dart';
import 'package:template/screens/main_drawer.dart';
import 'package:template/screens/main_text_field.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MessageProperties>(create: (context) => MessageProperties()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CNU | CHATBOT',
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 53.0,
        child: CustomScrollView(
          controller: context.read<MessageProperties>().scrollController,
          slivers: const [
            MainAppBar(),
            MainBody(),
          ],
        ),
      ),
      bottomSheet: const MainTextField(),
    );
  }
}
