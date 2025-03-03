import 'package:flutter/cupertino.dart';

class ReuseIconAndText extends StatefulWidget {
  final String title;
  final IconData icon;

  const ReuseIconAndText({super.key,required this.title,required this.icon});

  @override
  State<ReuseIconAndText> createState() => _ReuseIconAndTextState();
}

class _ReuseIconAndTextState extends State<ReuseIconAndText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon),
        Text(widget.title),
      ],
    );
  }
}
