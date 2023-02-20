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
        childCount: context.select((MessageProperties m) => m.agentMessage.length),
        (context, index) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              index == 0 ? const Visibility(visible: false, child: Text('Trigger')) :
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(context.read<MessageProperties>().dateTime[index], style: const TextStyle(color: Color(0xff001555), fontSize: 13)),
                  Card(
                    elevation: 0.0,
                    color: const Color(0xffffffff),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(context.read<MessageProperties>().clientMessage[index], style: const TextStyle(color: Color(0xff8da5a3))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 65),
                        child: Card(
                          elevation: 0.0,
                          color: const Color(0xffedf4ff),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('차차 ', style: TextStyle(color: Color(0xff001555), fontSize: 15, fontWeight: FontWeight.bold)),
                                    Text(context.read<MessageProperties>().dateTime[index], style: const TextStyle(color: Color(0xff001555), fontSize: 13)),
                                  ],
                                ),
                                context.read<MessageProperties>().agentMessageImage[index] == 'none' ? const Visibility(visible: false, child: Text('NONE')) : Image.network(context.read<MessageProperties>().agentMessageImage[index]),
                                Html(data: context.watch<MessageProperties>().agentMessage[index], shrinkWrap: true, style: {"body":Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero)}),
                                context.read<MessageProperties>().agentButton[index] == 'none'
                                  ? const Visibility(visible: false, child: Text('NONE'))
                                  : context.read<MessageProperties>().agentButton[index]
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ) /*여기가 List Tile!!!!!!!!!!*/
      )
    );
  }
}

