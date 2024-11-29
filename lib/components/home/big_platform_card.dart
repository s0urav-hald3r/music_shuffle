import 'package:flutter/material.dart';
import 'package:music_shuffle/config/constants.dart';

class BigPlatformCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  final Function callBack;
  const BigPlatformCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        icon,
        const SizedBox(width: 20),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: whiteColor,
            ),
          ),
          SizedBox(
            width: 250,
            child: Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color(0xFFEBEBF5).withOpacity(.6),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Container(
          //   width: 80,
          //   padding: const EdgeInsets.symmetric(vertical: 5),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(95),
          //     color: const Color(0xFF1E1E1E),
          //   ),
          //   child: const Center(
          //     child: Text(
          //       'Added',
          //       style: TextStyle(
          //         fontWeight: FontWeight.w400,
          //         fontSize: 12,
          //         color: Color(0xFF8D8D93),
          //       ),
          //     ),
          //   ),
          // )
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(95),
              gradient: const LinearGradient(
                colors: [Color(0xFF3D05DD), Color(0xFFFCB0F3)],
              ),
            ),
            child: const Center(
              child: Text(
                'Added',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          )
        ])
      ]),
    );
  }
}
