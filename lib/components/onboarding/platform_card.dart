import 'package:flutter/material.dart';

class PlatformCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget action;
  const PlatformCard({
    super.key,
    required this.icon,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(children: [
        icon,
        const SizedBox(width: 16),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        action
      ]),
    );
  }
}
