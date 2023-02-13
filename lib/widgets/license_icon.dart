import 'package:flutter/material.dart';

class LicenseIcon extends StatelessWidget {
  const LicenseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: 50.0,
          height: 50.0,
          child: Image.asset('assets/images/emblem.jpg'),
        ),
      ),
    );
  }
}

