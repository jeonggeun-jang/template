import 'package:flutter/material.dart';
import 'package:template/widgets/license_icon.dart';

class DInfo extends StatelessWidget {
  const DInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info),
      title: const Text('정보'),
      subtitle: const Text('Information'),
      onTap: () {
        showAboutDialog(
          context: context,
          applicationIcon: const LicenseIcon(),
          applicationVersion: 'Application Version : 1.0.0',
          applicationName: '충남대학교 | CHATBOT',
          applicationLegalese: '34134 대전광역시 유성구 대학로 99 충남대학교\nCopyright (C) 2023 CNU All Rights Reserved.',
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text('본 애플리케이션에서 제공하는 자료에 대한 무단 복제 및 배포는 원칙적으로 금합니다.'),
            )
          ]
        );
      },
    );
  }
}

