import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DHome extends StatelessWidget {
  const DHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: const Icon(Icons.home),
        title: const Text('홈페이지'),
        subtitle: const Text('Homepage'),
        children: [
          ListTile(
            title: const Text('대표 홈페이지'),
            subtitle: const Text('Main Homepage'),
            onTap: () => launchUrl(Uri.parse('https://plus.cnu.ac.kr/html/kr/index.html')),
          ),
          ListTile(
            title: const Text('입학처 홈페이지'),
            subtitle: const Text('Admission Officer Homepage'),
            onTap: () => launchUrl(Uri.parse('https://ipsi.cnu.ac.kr/intro.html')),
          ),
        ],
      ),
    );
  }
}

