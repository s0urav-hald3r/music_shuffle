import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_shuffle/config/constants.dart';

class PlatformCard extends StatelessWidget {
  final String icon;
  final String title;
  final Function callBack;
  const PlatformCard({
    super.key,
    required this.icon,
    required this.title,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(children: [
        CircleAvatar(
          radius: 24,
          child: Image.asset(icon),
        ),
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
        InkWell(
          onTap: () {},
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: whiteColor),
            ),
            child: Center(
              child: SvgPicture.asset(addIcon, color: whiteColor),
            ),
          ),
        )
      ]),
    );
  }
}
