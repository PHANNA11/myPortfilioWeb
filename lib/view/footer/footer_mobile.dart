import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: const Text('Contact Us'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('Privacy'),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('Cookies'),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('Terms & Service'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: const Text('2024 TheWeekedFlutter.com'),
        ),
      ],
    );
  }
}
