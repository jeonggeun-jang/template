import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DContact extends StatelessWidget {
  const DContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: const Icon(Icons.phone_android),
        title: const Text('문의하기'),
        subtitle: const Text('Contact'),
        children: [
          ListTile(
            title: const Text('일반 문의'),
            subtitle: const Text('Main Contact'),
            onTap: () => launchUrl(Uri.parse('tel:042 821 5114')),
          ),
          ListTile(
            title: const Text('입학 문의'),
            subtitle: const Text('Admission Officer Contact'),
            onTap: () => launchUrl(Uri.parse('tel:1644 8433')),
          ),
        ],
      ),
    );
  }
}
