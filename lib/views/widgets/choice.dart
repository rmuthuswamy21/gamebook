import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const Choice({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTap,
          icon: const Icon(Icons.run_circle),
        ),
        const SizedBox(width: 4),
        Flexible(child: Text(text)),
      ],
    );
  }
}
