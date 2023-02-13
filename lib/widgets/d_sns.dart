import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DSns extends StatelessWidget {
  const DSns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: const Icon(Icons.message),
        title: const Text('소셜 네트워크'),
        subtitle: const Text('SNS'),
        children: [
          ListTile(
            title: const Text('유튜브'),
            subtitle: const Text('Youtube'),
            trailing: const Icon(FontAwesomeIcons.youtube),
            onTap: () => launchUrl(Uri.parse('https://www.youtube.com/channel/UCq7akI5OzcKwtn0Sd9TFL0w')),
          ),
          ListTile(
            title: const Text('인스타그램'),
            subtitle: const Text('Instagram'),
            trailing: const Icon(FontAwesomeIcons.instagram),
            onTap: () => launchUrl(Uri.parse('https://www.instagram.com/cnu_now/')),
          ),
          ListTile(
            title: const Text('페이스북'),
            subtitle: const Text('Facebook'),
            trailing: const Icon(FontAwesomeIcons.facebook),
            onTap: () => launchUrl(Uri.parse('https://www.facebook.com/CNUNOW/')),
          ),
          ListTile(
            title: const Text('블로그'),
            subtitle: const Text('Blog'),
            trailing: const Icon(FontAwesomeIcons.blogger),
            onTap: () => launchUrl(Uri.parse('https://blog.naver.com/cnunow')),
          ),
        ],
      ),
    );;
  }
}

