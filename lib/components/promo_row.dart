import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'custom_icons.dart';

class PromoRow extends StatelessWidget {
  const PromoRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.code),
          color: Colors.white,
          iconSize: 40.0,
          onPressed: () => launch('https://github.com/matttodd/high_low_box_office'),
        ),
        IconButton(
          icon: const Icon(Icons.person),
          color: Colors.white,
          iconSize: 40.0,
          onPressed: () => launch('https://www.matttodd.tk'),
        ),
        IconButton(
          icon: const Icon(Icons.play_arrow),
          color: Colors.white,
          iconSize: 40.0,
          onPressed: () => launch(
              'https://www.youtube.com/channel/UCWsZvTt1pHuqxEflozZUbQA'),
        ),
        IconButton(
          icon: const Icon(CustomIcons.twitter),
          color: Colors.white,
          iconSize: 30.0,
          onPressed: () => launch(
              'https://twitter.com/fakematttodd'),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Text("Built by Matt Todd", style: kPromoTextStyle,),
        )
      ],
    );
  }
}