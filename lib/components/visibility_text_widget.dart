import 'package:flutter/material.dart';

class VisibilityText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(text, style: style, textAlign: TextAlign.center,),
      ),
    );
  }

  const VisibilityText(this.text, {this.style, Key? key}) : super(key: key);
}
