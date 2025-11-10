import 'package:flutter/material.dart';

class TextOverlay extends StatelessWidget {
  final String text;
  const TextOverlay({super.key, required this.text});
  @override
  Widget build(BuildContext context) => Text(text);
}
