import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:template/models/message_properties.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: context.select((MessageProperties m) => m.clientMessage.length),
        (context, index) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                elevation: 0.0,
                color: const Color(0xffffffff),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(context.read<MessageProperties>().clientMessage[index], style: const TextStyle(color: Color(0xff8da5a3))),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/character.png'),
                    radius: 20,
                    backgroundColor: Color(0xffd5e3ff),
                  ),
                  const SizedBox(width: 5.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 0.0,
                        color: const Color(0xfff3ffff),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text('차차 ', style: TextStyle(color: Color(0xff001555), fontSize: 15, fontWeight: FontWeight.bold)),
                                  Text('오후 2:03', style: TextStyle(color: Color(0xff001555), fontSize: 13)),
                                ],
                              ),
                              Html(data: context.read<MessageProperties>().clientMessage[index], shrinkWrap: true,
                                style: {"body":Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero)},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}

